//
//  Array.swift
//  trlnk-demo
//
//  Created by Админ on 02.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
//telephoneArray[safe: indexPath.row - 1]


extension NSSet {
  func toArray<T>() -> [T] {
    let array = self.map({ $0 as! T})
    return array
  }
}


extension Array {
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
}
