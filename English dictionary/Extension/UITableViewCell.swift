//
//  UITableViewCell.swift
//  trlnk-demo
//
//  Created by Админ on 04.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    func selectedColor(_ color: UIColor = .clear){
        let cView = UIView()
        self.selectedBackgroundView = cView
        cView.backgroundColor = color
    }
    
}
