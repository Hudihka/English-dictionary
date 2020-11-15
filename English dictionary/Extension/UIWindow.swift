//
//  UIWindow.swift
//  trlnk-demo
//
//  Created by Админ on 01.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    
    func transitionRoot(to: UIViewController, duration: TimeInterval = 0.5, completion: ((Bool) -> Void)? = nil){
        
        //.transitionCurlUp листаем сттраницы
        //.transitionCrossDissolve по сути пресент плавный и без анимации
        //.transitionFlipFromTop    переворот но не с права на лево а с верху в низ
        //.preferredFramesPerSecond60 вообще хрен знает
        
        UIView.transition(with: self, duration: duration, options: .transitionFlipFromLeft, animations: {
            self.rootViewController = to
        }, completion: completion)
    }

    var visibleViewController: UIViewController? {  //UIApplication.shared.keyWindow?.visibleViewController получить активный ВК
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }

    static func getVisibleViewControllerFrom(_ vc: UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(nc.visibleViewController)
        } else if let tc = vc as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tc.selectedViewController)
        } else {
            if let pvc = vc?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(pvc)
            } else {
                return vc
            }
        }
    }
    
}
