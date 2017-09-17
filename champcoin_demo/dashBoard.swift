//
//  dashBoard.swift
//  champcoin_demo
//
//  Created by Telerain Inc on 9/12/17.
//  Copyright © 2017 Voip Helper. All rights reserved.
//
import UIKit
import Foundation
import Alamofire
import Material


class dashBoard: UITableViewController {
    
   @IBOutlet weak var logo: UIImageView!
    
    private let myArray: NSArray = ["First","Second","Third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //        self.navigationController?.isNavigationBarHidden = false
    }


}
