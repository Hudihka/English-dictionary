//
//  UIColor.swift
//  trlnk-demo
//
//  Created by Админ on 01.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /**
     initiate UIColor from int hex values
     ```
     // Custom Color: usage
     let color = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF)
     ```
     */
    public convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     initiate UIColor from int hex value
     ```
     // Custom Color:
     let myGreenColor = UIColor(rgb:0x57BC90)
     ```
     */
    public convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    public convenience init?(hexStr: String) {
        let r, g, b: CGFloat

        if hexStr.hasPrefix("#") {
            let start = hexStr.index(hexStr.startIndex, offsetBy: 1)
            let hexColor = String(hexStr[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            }
        }

        return nil
    }
}
