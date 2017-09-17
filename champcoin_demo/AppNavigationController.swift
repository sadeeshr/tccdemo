//
//  AppNavigationController.swift
//  champcoin_demo
//
//  Created by Telerain Inc on 9/11/17.
//  Copyright © 2017 Voip Helper. All rights reserved.
//

import Foundation
import UIKit
import Material

class AppNavigationController: NavigationController {
    open override func prepare() {
        super.prepare()
        guard let v = navigationBar as? NavigationBar else {
            return
        }
        v.depthPreset = .none
        v.dividerColor = Color.grey.lighten2
    }
}
