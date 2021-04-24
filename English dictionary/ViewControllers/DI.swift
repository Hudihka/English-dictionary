//
//  DI.swift
//  English dictionary
//
//  Created by Админ on 24.04.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
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

class Builder{
    
    static func route() -> StartViewController {
        let NVC = EnumStoryboard.main.vc("StartedNavigationController") as! UINavigationController
        let VC = NVC.viewControllers.first as! StartViewController
        
        let presenter = StartPresenter(view: VC)
        VC.presenter = presenter
        
        return VC
    }
    
    
    
}
