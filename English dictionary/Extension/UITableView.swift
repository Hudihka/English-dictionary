//
//  UITableView.swift
//  slavNeft
//
//  Created by Админ on 05.11.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func addRefreshControll(target: Any, refreshControl: UIRefreshControl, selector: Selector) {
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(target, action: selector, for: UIControl.Event.valueChanged)
        self.addSubview(refreshControl)
    }
    
    
}

