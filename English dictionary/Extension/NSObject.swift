//
//  NSObject.swift
//  trlnk-demo
//
//  Created by Админ on 09.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation

extension NSObject {
    static func performOnce(selector: Selector, afterDelay delay: TimeInterval, with object: Any? = nil) {
        cancelPreviousPerformRequests(withTarget: self, selector: selector, object: nil)
        self.perform(selector, with: object, afterDelay: delay)
    }

    func performOnce(selector: Selector, afterDelay delay: TimeInterval, with object: Any? = nil) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: selector, object: nil)
        self.perform(selector, with: object, afterDelay: delay)
    }

    class var className: String {
        return String(describing: self)
    }
}
