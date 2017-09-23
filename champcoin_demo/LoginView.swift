//
//  loginView.swift
//  champcoin_demo
//
//  Created by Telerain Inc on 9/11/17.
//  Copyright © 2017 Voip Helper. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import Material



class LoginView: UIViewController {
    
    @IBOutlet weak var userIdT: TextField!
    @IBOutlet weak var passwordT: TextField!
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.

//        self.userIdT.detailColor = Color.lightGreen.lighten3
//                self.userIdT.placeholderNormalColor = Color.amber.darken4
//                self.userIdT.placeholderActiveColor = Color.grey.lighten5
//                self.userIdT.dividerNormalColor = Color.cyan.base
//                self.userIdT.dividerActiveColor = Color.green.base
      
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.title="TCC - Sign In"
        self.navigationController?.title="The Champcoin Exchange"
        
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
 
    @IBAction func goLogin(_ sender: Any) {
        apiLogin()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        performSegue(withIdentifier: "goHome", sender: nil)
    }
    
    @IBAction func goForgotPassword(_ sender: Any) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        performSegue(withIdentifier: "goHelpPassword", sender: nil)
    }
    func apiLogin() {
        
        let userid = self.userIdT.text;
        let password = self.passwordT.text;
        
        
//        method=securelogin&referid=100480295&password=sadeesh@123&lat=29.6776137&lng=77.0014347&imei=866234024940130&version=v1.2&device_name=vivo X5Pro&appkey=abc
//method=dashboardnew&uniqueid=40011
        
//        let request = "method=securelogin&referid="+userid!+"&password="+password!+"&lat=29.6776137&lng=77.0014347&imei=866234024940130&version=v1.2&device_name=vivo X5Pro&appkey=abc"
        
        let request = "method=securelogin&referid=100480295&password=sadeesh@123&lat=29.6776137&lng=77.0014347&imei=866234024940130&version=v1.2&device_name=vivo X5Pro&appkey=abc"
        
        let ccApi = CcApi()
        ccApi.ccPost(data: request) {
            (response) in
            
                print(response)

//            self.apiLoginResponseHandler(response: "yes")
            
        }
//        print(response as Any)
        
    }
    
    func apiLoginResponseHandler(response : Any) -> Void {
        performSegue(withIdentifier: "goHome", sender: nil)
    }}
