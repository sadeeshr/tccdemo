//
//  NewAccountView.swift
//  champcoin_demo
//
//  Created by Manivendhan on 22/09/17.
//  Copyright © 2017 Voip Helper. All rights reserved.
//

import UIKit


class NewAccountView: UIViewController {

   
    @IBOutlet weak var unameT: UITextField!
    @IBOutlet weak var umailidT: UITextField!
    @IBOutlet weak var upwdT: UITextField!
    @IBOutlet weak var uconfirmpwdT: UITextField!
    @IBOutlet weak var dobB: UITextField!
    @IBOutlet weak var umobT: UITextField!
    @IBOutlet weak var ureferalidT: UITextField!
    @IBOutlet weak var ucountryT: UITextField!
    @IBOutlet weak var ustateT: UITextField!
    @IBOutlet weak var ucityT: UITextField!
    @IBOutlet weak var checkboxB: UIButton!
    
    var checkbox_selected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func terms_condition(_ sender: Any) {
        
    }

    @IBAction func terms_checkbox(_ sender: Any) {
       
        

        if !checkbox_selected {
            checkbox_selected = true
             let checkimg = UIImage(named: "check.png") as UIImage!
            checkboxB.setImage(checkimg, for: .normal)
        }else{
            checkbox_selected = false
            let uncheckimg = UIImage(named: "uncheck.png") as UIImage!
            checkboxB.setImage(uncheckimg, for: .normal)
        }
        
    }
    @IBAction func user_dob(_ sender: Any) {
        
    }
    @IBAction func submit(_ sender: Any) {
        
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
