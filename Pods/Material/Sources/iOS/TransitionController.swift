/*
 * Copyright (C) 2015 - 2017, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *	*	Redistributions of source code must retain the above copyright notice, this
 *		list of conditions and the following disclaimer.
 *
 *	*	Redistributions in binary form must reproduce the above copyright notice,
 *		this list of conditions and the following disclaimer in the documentation
 *		and/or other materials provided with the distribution.
 *
 *	*	Neither the name of CosmicMind nor the names of its
 *		contributors may be used to endorse or promote products derived from
 *		this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

internal extension UIViewController {
    /**
     Finds a view controller with a given type based on
     the view controller subclass.
     - Returns: An optional of type T.
     */
    func traverseViewControllerHierarchyForClassType<T: UIViewController>() -> T? {
        var v: UIViewController? = self
        while nil != v {
            if v is T {
                return v as? T
            }
            v = v?.parent as? TransitionController
        }
        
        return Application.rootViewController?.traverseTransitionViewControllerHierarchyForClassType()
    }
    
    /**
     Traverses the child view controllers to find the correct view controller type T.
     - Returns: An optional of type T.
     */
    func traverseTransitionViewControllerHierarchyForClassType<T: UIViewController>() -> T? {
        if let v = self as? T {
            return v
        } else if let v = self as? TransitionController {
            return v.rootViewController.traverseTransitionViewControllerHierarchyForClassType()
        }
        
        return nil
    }
}

open class TransitionController: UIViewController {
	/**
     A Boolean property used to enable and disable interactivity
     with the rootViewController.
     */
	@IBInspectable
    open var isUserInteractionEnabled: Bool {
		get {
			return rootViewController.view.isUserInteractionEnabled
		}
		set(value) {
			rootViewController.view.isUserInteractionEnabled = value
		}
	}
	
    /// A reference to the container view.
    @IBInspectable
    open let container = UIView()
    
	/**
     A UIViewController property that references the active
     main UIViewController. To swap the rootViewController, it
     is recommended to use the transitionFromRootViewController
     helper method.
     */
	open internal(set) var rootViewController: UIViewController!
	
    /// The transition type used during a transition.
    open var motionTransitionType = MotionTransitionType.fade
    
	/**
     An initializer that initializes the object with a NSCoder object.
     - Parameter aDecoder: A NSCoder instance.
     */
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	/**
     An initializer that initializes the object with an Optional nib and bundle.
     - Parameter nibNameOrNil: An Optional String for the nib.
     - Parameter bundle: An Optional NSBundle where the nib is located.
     */
	public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	/**
     An initializer for the BarController.
     - Parameter rootViewController: The main UIViewController.
     */
	public init(rootViewController: UIViewController) {
		super.init(nibName: nil, bundle: nil)
		self.rootViewController = rootViewController
	}
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
    }
	
	open override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		layoutSubviews()
	}
    
	/**
     A method to swap rootViewController objects.
     - Parameter toViewController: The UIViewController to swap
     with the active rootViewController.
     - Parameter completion: A completion block that is execited after
     the transition animation from the active rootViewController
     to the toViewController has completed.
     */
	open func transition(to viewController: UIViewController, completion: ((Bool) -> Void)? = nil) {
        guard let fvc = rootViewController else {
            return
        }
        
        let tvc = viewController
        
        tvc.view.isHidden = false
        tvc.view.frame = container.bounds
        tvc.motionModalTransitionType = motionTransitionType
        
        view.isUserInteractionEnabled = false
        Motion.shared.transition(from: fvc, to: tvc, in: container) { [weak self, tvc = tvc, completion = completion] (isFinished) in
            guard let s = self else {
                return
            }
            
            s.rootViewController = tvc
            s.view.isUserInteractionEnabled = true
            completion?(isFinished)
        }
	}
	
	/**
     To execute in the order of the layout chain, override this
     method. `layoutSubviews` should be called immediately, unless you
     have a certain need.
     */
	open func layoutSubviews() {}
	
	/**
     Prepares the view instance when intialized. When subclassing,
     it is recommended to override the prepare method
     to initialize property values and other setup operations.
     The super.prepare method should always be called immediately
     when subclassing.
     */
	open func prepare() {
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.contentScaleFactor = Screen.scale
        
        prepareContainer()
        prepareRootViewController()
	}
}

internal extension TransitionController {
    /// Prepares the container view.
    func prepareContainer() {
        container.frame = view.bounds
        container.clipsToBounds = true
        container.contentScaleFactor = Screen.scale
        container.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(container)
    }
    
    /// A method that prepares the rootViewController.
    func prepareRootViewController() {
        prepare(viewController: rootViewController, in: container)
    }
    
    /**
     A method that adds the passed in controller as a child of
     the BarController within the passed in
     container view.
     - Parameter viewController: A UIViewController to add as a child.
     - Parameter in container: A UIView that is the parent of the
     passed in controller view within the view hierarchy.
     */
    func prepare(viewController: UIViewController?, in container: UIView) {
        guard let v = viewController else {
            return
        }
        
        addChildViewController(v)
        container.addSubview(v.view)
        v.didMove(toParentViewController: self)
        v.view.frame = container.bounds
        v.view.clipsToBounds = true
        v.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        v.view.contentScaleFactor = Screen.scale
    }
}
