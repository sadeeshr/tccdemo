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
        
        let usr_name = unameT.text
        let usr_mail = umailidT.text
        let usr_password = upwdT.text
        let usr_confirmpassword = uconfirmpwdT.text
        let usr_DOB = dobB.text
        let usr_mobno = umobT.text
        var usr_referral = ureferalidT.text
        let usr_country = ucountryT.text
        let usr_state = ustateT.text
        let usr_city = ucityT.text
        
        if (usr_name?.isEmpty)! {
            self.showalert("Error!", "User Name is Empty")
        }else if (usr_mail?.isEmpty)! && !isValidEmail(mailid: usr_mail!){
            self.showalert("Error!", "Invalid User Mail ID")
        }else if (usr_password?.isEmpty)!{
            self.showalert("Error!", "Invalid Password")
        }else if ((usr_confirmpassword?.isEmpty)! || usr_password != usr_confirmpassword){
            self.showalert("Error!", "Password Mismatch")
        }else if (usr_DOB?.isEmpty)!{
            self.showalert("Error!", "Please Enter Valid DOB")
        }else if (usr_mobno?.isEmpty)!{
            self.showalert("Error!", "Please Enter Valid Mobile Number")
        }else if (usr_country?.isEmpty)!{
            self.showalert("Error!", "Select Valid Country Name")
        }else if (usr_state?.isEmpty)!{
            self.showalert("Error!", "Please Enter Valid State Name")
        }else if (usr_city?.isEmpty)!{
            self.showalert("Error!", "Please Enter Valid City Name")
        }else{
            if (usr_referral?.isEmpty)! {
                usr_referral = "4224193"
            }
            
            let request = "method=registeruser&loginid=\(usr_mail!)&firstname=\(usr_name!)&lastname=\(usr_name!)&gender=M&dob=\(usr_DOB!)&country=98&mobile=\(usr_mobno!)&registerby=\(usr_referral!)&image=nnnn&devicename=samsungSM-J200G&uniqueid=359268072214059&emailid=\(usr_mail!)&password=\(usr_confirmpassword!)&address=abc&city=\(usr_city!)&state=\(usr_state!)&pincode=1234&tpassword=\(usr_confirmpassword!)&ifroot=N&devicekey=fwKWkdkeFPU:APA91bFJYGLt_rKrSYIXnCY2rNurazPQm5qPdajLui07hPTSkutcEyEtNqvpyAghioKzsasr6LOhFswpGB8zlgVrU_Yqw6XmlSvyWa8orMctqCp8e0L7nQd5qRLWSY6-CWHczIAyQash";
            
            let ccApi = CcApi()
            ccApi.ccPost(data: request) {
                (response) in
                
                print("Register Response from server\(response)")
                
                
            }

        }
        
        
        
    }
    func showalert(_ title: String, _ message: String) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func isValidEmail(mailid:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: mailid)
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
