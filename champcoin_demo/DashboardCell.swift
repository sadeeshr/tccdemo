//
//  DashboardCell.swift
//  champcoin_demo
//
//  Created by Telerain Inc on 9/13/17.
//  Copyright © 2017 Voip Helper. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {

    @IBOutlet weak var stateImage: UIImageView!
    @IBOutlet weak var stateText: UILabel!
    @IBOutlet weak var stateAmount: UILabel!
    @IBOutlet weak var stateTime: UILabel!
    @IBOutlet weak var stateName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        stateImage.layer.borderWidth = 1
        stateImage.masksToBounds = false
//        stateImage.borderColor = UIColor.black
        stateImage.cornerRadius = stateImage.frame.height/2
        stateImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
