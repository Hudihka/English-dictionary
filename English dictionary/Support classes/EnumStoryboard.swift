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
    
    case main                   = "Main"
    
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
