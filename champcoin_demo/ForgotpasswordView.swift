//
//  ForgotpasswordView.swift
//  champcoin_demo
//
//  Created by Manivendhan on 22/09/17.
//  Copyright © 2017 Voip Helper. All rights reserved.
//

import UIKit
import Material


class ForgotpasswordView: UIViewController {

    
    
    @IBOutlet weak var forgot_fieldbtn: FlatButton!
    @IBOutlet weak var pwd_input: UITextField!
    var inputtype = "userid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forgotpwd(_ sender: Any) {
        if inputtype == "userid" {
            inputtype = "email"
            pwd_input.placeholder = "Enter your Email ID"
            forgot_fieldbtn.title = "Remember ID?"
        }else{
            inputtype = "userid"
            pwd_input.placeholder = "Enter your User ID"
            forgot_fieldbtn.title = "Forgot your ID?"
        }
    }

    @IBAction func resetpwd(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
