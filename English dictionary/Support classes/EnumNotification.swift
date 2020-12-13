//
//  EnumNotification.swift
//  English dictionary
//
//  Created by Hudihka on 13/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation
import UIKit

enum EnumNotification: String{
    

    case UIApplicationDidBecomeActive               = "UIApplicationDidBecomeActive"             //вышли из бэкгр
    case UIApplicationDidEnterBackground            = "UIApplicationDidEnterBackground"          //ушли в бэкгр
    case ApplicationWillResignActive                = "ApplicationWillResignActive"              //собираемся уйти в бэкгр
    case UIApplicationDidBecomeActiveNotification   = "UIApplicationDidBecomeActiveNotification" //Опубликовано, когда приложение становится активным.
    
    case UIKeyboardWillShow                         = "UIKeyboardWillShow"
    case UIKeyboardWillHide                         = "UIKeyboardWillHide"
    
    //обучение
    
    case traningStep                                = "traningStep"
    case finishSwipeCell                            = "finishSwipeCell"
    
    
    var nameNotific: NSNotification.Name {
        
        switch self {
        case .UIApplicationDidBecomeActive:
            return UIApplication.didBecomeActiveNotification
        case .UIApplicationDidEnterBackground:
            return UIApplication.didEnterBackgroundNotification
        case .ApplicationWillResignActive:
            return UIApplication.willResignActiveNotification
        case .UIApplicationDidBecomeActiveNotification:
            return UIApplication.didBecomeActiveNotification
        case .UIKeyboardWillShow:
            return UIApplication.keyboardWillShowNotification
        case .UIKeyboardWillHide:
            return UIApplication.keyboardWillHideNotification
        default:
            return NSNotification.Name("EnglishDictionary.Notification." + self.rawValue)
        }
        
    }

    func subscribeNotific(observer: Any, selector: Selector){
        NotificationCenter.default.addObserver(observer,
                                               selector: selector,
                                               name: self.nameNotific,
                                               object: nil)
    }

    func notific() {
        NotificationCenter.default.post(name: self.nameNotific, object: nil)
    }

    func notific(object: Any?) {
        NotificationCenter.default.post(name: self.nameNotific, object: object)
    }

    func notific(userInfo: [String: Any]) {
        NotificationCenter.default.post(name: self.nameNotific, object: nil, userInfo: userInfo)
    }
}
