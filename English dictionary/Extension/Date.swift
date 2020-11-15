//
//  Date.swift
//  trlnk-demo
//
//  Created by Админ on 07.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation

extension Date {
    
    var hour: Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let str = dateFormatter.string(from: self)
        return Int(str)
    }
    
    func printDate(format: String = "yyyy-MM-dd HH:mm:ssZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: self)
    }

}
