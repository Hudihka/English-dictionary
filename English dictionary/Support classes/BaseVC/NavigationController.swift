//
//  NavigationController.swift
//  trlnk-demo
//
//  Created by Админ on 09.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearBar()
        self.fontBar(font: UIFont(name: "SFProText-Regular", size: 17), color: .white)
    }
    

}
