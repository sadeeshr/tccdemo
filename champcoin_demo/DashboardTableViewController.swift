//
//  DashboardTableViewController.swift
//  champcoin_demo
//
//  Created by Telerain Inc on 9/12/17.
//  Copyright © 2017 Voip Helper. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import Material
import SwiftyJSON
import SwiftIcons

class DashboardTableViewController: UITableViewController {

    private var paymentHistory: [JSON] = []
    @IBOutlet weak var appTabBar: UITabBar!


    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.register(DashboardCell.self, forCellReuseIdentifier: "payCell")


        self.hideKeyboardWhenTappedAround()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        //self.title="TCC"
        
//        appTabBar.items?[0].setIcon(icon: .fontAwesome(.exchange), size: nil, textColor: Color.orange.lighten4 )
        print(apiDashboard())
    }

    
    func apiDashboard() -> String {
        
        
        //method=dashboardnew&uniqueid=40011
        
        let request = "method=dashboardnew&uniqueid=40011"
        
        let ccApi = CcApi()
        ccApi.ccPost(data: request) {
            (response) in
            
//            print(response)
            let json = JSON(data: (response.data(using: .utf8))!)
//            print("json data: ", json["champ"]["root"]["paymenthistory"])
            let dashdata = json["champ"]["root"]["paymenthistory"]
            
//            for subJson in dashdata.arrayValue {
//                
//            }
            
            self.paymentHistory = dashdata.arrayValue;
                //Now you got your value
                print("dashboard data: ",self.paymentHistory);
            self.tableView.reloadData()
//                for(index, payObj):(String, JSON) in dashdata {
//                    var payObject:[String] = []
//                    payObject.append(payObj[index]["name"].stringValue)
//                    payObject.append(payObj[index]["tid"].stringValue)
//                    payObject.append(payObj[index]["before_balance"].stringValue)
//                    payObject.append(payObj[index]["date"].stringValue)
//                    payObject.append(payObj[index]["after_balance"].stringValue)
//                    payObject.append(payObj[index]["amount"].stringValue)
//                    payObject.append(payObj[index]["pay_mode"].stringValue)
//                    payObject.append(payObj[index]["type"].stringValue)
//                    payObject.append(payObj[index]["referid"].stringValue)
//                    
//                    self.paymentHistory.append(payObject)
//                    
//                }
            
        }
        
        return "yes"
    }
    
    
    //    if let timeAgo = timeAgoSinceDate(yourInfoAsDateFormat) {
    //
    //        yourLabel.text = timeAgo
    //
    //    }
    func timeAgoSinceDate(_ date:Date, numericDates:Bool = false) -> String {
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = Date()
        print(date)
        let earliest = now < date ? now : date
        let latest = (earliest == now) ? date : now
        print(earliest)
        print(latest)
        print(now)
        let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
        
        print(components)
        
        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second! >= 3) {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }
        
    }
    


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(paymentHistory[indexPath.row])")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return paymentHistory.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "payCell", for: indexPath) as! DashboardCell

        // Configure the cell...
        let paymentObj : JSON = paymentHistory[indexPath.row]
        if(paymentHistory.count > 0) {
            
            print(NSDate())
            print(timeAgoSinceDate(NSDate() as Date))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-mm-yyyy HH:mm:ss a"
//            let newdate: Date = dateFormatter.date(from: paymentObj["date"].stringValue)!
            cell.stateTime.text! = paymentObj["date"].stringValue
            cell.stateAmount.text! = paymentObj["amount"].stringValue
            cell.stateName.text! = paymentObj["name"].stringValue
            
            if (paymentObj["pay_mode"].stringValue.range(of: "Sent") != nil) {
                cell.stateText.text! = "Sent"
                cell.stateImage.backgroundColor = Color.deepOrange.lighten1
                cell.stateImage.setIcon(icon: .fontAwesome(.angleDoubleRight),  textColor: Color.grey.lighten5, size: CGSize(width: 20, height: 20))
            } else if (paymentObj["pay_mode"].stringValue.range(of: "Received") != nil) {
                cell.stateText.text! = "Received"
                cell.stateImage.backgroundColor = Color.lightGreen.lighten1
                cell.stateImage.setIcon(icon: .fontAwesome(.angleDoubleLeft),  textColor: Color.grey.lighten5, size: CGSize(width: 20, height: 20))
            }
            
            cell.stateImage.layer.cornerRadius = cell.stateImage.frame.width / 2
            cell.stateImage.clipsToBounds = true

        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
