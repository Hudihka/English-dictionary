//
//  String.swift
//  trlnk-demo
//
//  Created by Админ on 07.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation

extension String {
    
    func deleteSumbol(sumbol: String) -> String {
        var str = ""
        self.components(separatedBy: sumbol).forEach { (obj) in
            str += obj
        }

        return str
    }

    var textEditor: String? { //удаляе с конца строки пробелы
        var text = self
        while text.last == "\n" || text.last == " " {
            if !text.isEmpty {
                text.removeLast()
            }
        }

        return text == "" ? nil : text
    }
	
	var textEditorFirst: String? { //удаляе с начала строки пробелы
        var text = self
        while text.first == "\n" || text.first == " " {
            if !text.isEmpty {
                text.removeFirst()
            }
        }

        return text == "" ? nil : text
    }
    
    
    func getDatwToString(_ formater: String = "yyyy-MM-dd HH:mm:ssZ") -> Date? { //переобраз строку в дату
        //2019-06-07 07:56:17+00

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formater

        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self) // replace Date String
    }
    
}
