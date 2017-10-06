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
        let request = "method=registeruser&loginid=makw4224193@gmail.com&firstname=Hukuingh Makwana&lastname=Hukuingh Makwana&gender=M&dob=1975-05-04&country=98&mobile=822499®isterby=4224193&image=nnnn&devicename=samsungSM-J200G&uniqueid=359268072214059&emailid=makwan4224193@gmail.com&password=9516&address=abc&city=chich&state=Madhay Pradesh&pincode=1234&tpassword=95165&ifroot=N&devicekey=fwKWkdkeFPU:APA91bFJYGLt_rKrSYIXnCY2rNurazPQm5qPdajLui07hPTSkutcEyEtNqvpyAghioKzsasr6LOhFswpGB8zlgVrU_Yqw6XmlSvyWa8orMctqCp8e0L7nQd5qRLWSY6-CWHczIAyQash";
        
        let ccApi = CcApi()
        ccApi.ccPost(data: request) {
            (response) in
            
            print("Register Response from server\(response)")
            
            
        }

        
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
