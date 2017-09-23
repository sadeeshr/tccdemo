//
//  mainView.swift
//  champcoin_demo
//
//  Created by Telerain Inc on 9/11/17.
//  Copyright © 2017 Voip Helper. All rights reserved.
//


import UIKit
import Foundation
import Alamofire
import Material
import SwiftIcons

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class MainView: UIViewController {
    @IBOutlet weak var helpB: FABButton!
    @IBOutlet weak var aboutB: FABButton!
    @IBOutlet weak var signinB: RaisedButton!
    @IBOutlet weak var registerB: FlatButton!
    @IBOutlet weak var termsB: FlatButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aboutB.setIcon(icon: .fontAwesome(.infoCircle),  color: .lightGray, forState: .normal)
        helpB.setIcon(icon: .fontAwesome(.questionCircle),  color: .lightGray, forState: .normal)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    @IBAction func goHelp(_ sender: Any) {
    }
  
    @IBAction func goAbout(_ sender: Any) {
    }
  
    @IBAction func goSignIn(_ sender: Any) {
//        let storyB = UIStoryboard(name: "Main", bunde: nil)
//        let lvc = LoginView(nibName:"LoginView", bundle: nil)
//        navigationController?.pushViewController(LoginView(), animated: true)
//        self.navigationController?.pushViewController(LoginView(), animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backgroundColor = Color.clear
        
        performSegue(withIdentifier: "goLogin", sender: nil)
    }
    
    @IBAction func goRegister(_ sender: Any) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backgroundColor = Color.clear
        
        performSegue(withIdentifier: "goNewAccount", sender: nil)
    }
    
    @IBAction func goTerms(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
