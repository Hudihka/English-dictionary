//
//  EnumStoryboard.swift
//  slavNeft
//
//  Created by Админ on 02.11.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation
import UIKit

enum EnumStoryboard: String {
    
    case auth                   = "Auth"
    case detailTask             = "DetailTask"
    case datePicker             = "DatePicker"
    case tasks                  = "Tasks"
    case favorits               = "Favorits"
    case archive                = "Archive"
    case reports                = "Reports"
    case notification           = "Notification"
    case profile                = "Profile"
    case main                   = "Main"
    case supportStoryboard      = "SupportStoryboard"
    
    var storyboard: UIStoryboard{
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    func vc(_ identifier: String) -> UIViewController{
        return self.storyboard.instantiateViewController(withIdentifier: identifier)
    }
    
    var instantiateVC: UIViewController?{

        return self.storyboard.instantiateInitialViewController()
    }
    
}
