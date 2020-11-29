//
//  Constant.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation
import UIKit

typealias JSON = [String : Any?]

let grayColor = UIColor(red: 65/255, green: 66/255, blue:68/255, alpha: 1)

let hDdevice: CGFloat = UIScreen.main.bounds.size.height
let wDdevice: CGFloat = UIScreen.main.bounds.size.width

var isIPhone5: Bool {
    return hDdevice == 568
}

var smallIPhone: Bool {
    return hDdevice < 670
}

var isIPhoneXorXmax: Bool {
        if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
    
        return false
}

var indentNavigationBarHeight: CGFloat {
    return statusBarHeight + navigBarHeight //88 : 64
}

var statusBarHeight: CGFloat{
    return isIPhoneXorXmax ? 44 : 20
}

let navigBarHeight: CGFloat = 44

var fullHeightNB: CGFloat {
    return statusBarHeight + navigBarHeight
}

var heightTabBar: CGFloat {
    return isIPhoneXorXmax ? 84 : 58
}
