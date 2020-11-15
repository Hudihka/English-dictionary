//
//  CustomBBItem.swift
//  Coo
//
//  Created by Админ on 05.10.2020.
//

import Foundation
import UIKit


public enum EnumImageBBItem: String{
    
    case archive     = "archive"
    case autors      = "autors"
    case file        = "file"
    case filter      = "filter"
    case pen         = "pen"
    case search      = "search"
    
    var image: UIImage {
        let image = UIImage(named: self.rawValue) ?? UIImage()
        return image.withRenderingMode(.alwaysOriginal)
    }
}

extension BaseViewController{
    
    func addBBItems(typeItemsLeft: [EnumImageBBItem]?, typeItemsRight: [EnumImageBBItem]?){
        
        if let typeItemsLeft = typeItemsLeft {
            let bbItemsLeft = typeItemsLeft.map({createBBItem(type: $0)})
            navigationItem.leftBarButtonItems = bbItemsLeft
        }
        
        if let typeItemsRight = typeItemsRight {
            let bbItemsRight = typeItemsRight.map({createBBItem(type: $0)})
            navigationItem.rightBarButtonItems = bbItemsRight
        }
        
    }
    
    
    private func createBBItem(type: EnumImageBBItem) -> UIBarButtonItem{
        
        var selector = #selector(tapArhive)
        
        switch type {
        case .autors:
            selector = #selector(tapAutors)
        case .file:
            selector = #selector(tapFile)
        case .filter:
            selector = #selector(tapFilter)
        case .pen:
            selector = #selector(tapPen)
        case .search:
            selector = #selector(tapSearch)
        default:
            selector = #selector(tapArhive)
        }
        
        return UIBarButtonItem(image: type.image,
                               style: .plain,
                               target: self,
                               action: selector)
        
    }
    
    //selectors
    
    @objc func tapArhive(){
        
    }
    
    @objc func tapAutors(){
        
    }
    
    @objc func tapFile(){
        
    }
    
    @objc func tapFilter(){
        
    }
    
    @objc func tapPen(){
        
    }
    
    @objc func tapSearch(){
        
    }
    
    
}


