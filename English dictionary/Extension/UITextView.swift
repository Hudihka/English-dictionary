//
//  UITextView.swift
//  Coo
//
//  Created by Админ on 06.10.2020.
//

import Foundation
import UIKit

extension UITextView{
    
    public var numberOfLines: Int {
        guard compare(beginningOfDocument, to: endOfDocument).same == false else {
            return 0
        }
        
        let direction: UITextDirection = UITextDirection(rawValue: UITextStorageDirection.forward.rawValue)
        var lineBeginning = beginningOfDocument
        var lines = 0
        while true {
            lines += 1
            guard let lineEnd = tokenizer.position(from: lineBeginning, toBoundary: .line, inDirection: direction) else {
                fatalError()
            }
            guard compare(lineEnd, to: endOfDocument).same == false else {
                break
            }
            guard let newLineBeginning = tokenizer.position(from: lineEnd, toBoundary: .character, inDirection: direction) else {
                fatalError()
            }
            guard compare(newLineBeginning, to: endOfDocument).same == false else {
                return lines + 1
            }
            lineBeginning = newLineBeginning
        }
        return lines
    }
    
    func resultString(string: String, range: NSRange) -> String {
        let text: NSString = (self.text ?? "") as NSString
        return text.replacingCharacters(in: range, with: string)
    }

    
    
}


public extension ComparisonResult {
    var ascending: Bool {
        switch self {
        case .orderedAscending:
            return true

        default:
            return false
        }
    }

    var descending: Bool {
        switch self {
        case .orderedDescending:
            return true

        default:
            return false
        }
    }

    var same: Bool {
        switch self {
        case .orderedSame:
            return true

        default:
            return false
        }
    }
}

