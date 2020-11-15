//
//  UITextField.swift
//  Открытие
//
//  Created by Админ on 10.09.2020.
//  Copyright © 2020 Админ. All rights reserved.
//

import Foundation
import UIKit


extension UITextField {

    func resultString(string: String, range: NSRange) -> String {
        let text: NSString = (self.text ?? "") as NSString
        return text.replacingCharacters(in: range, with: string)
    }

    func resultStringOptional(string: String, range: NSRange) -> String? {
        let text: NSString = (self.text ?? "") as NSString
		let newText = text.replacingCharacters(in: range, with: string)
		return newText.textEditor
    }
	
}
