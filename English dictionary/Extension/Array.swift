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
