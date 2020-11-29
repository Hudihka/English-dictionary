//
//  UIViewController.swift
//  trlnk-demo
//
//  Created by Админ on 02.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func clearNavigationBar(){
        navigationController?.clearBar()
    }
    
    func fontNavigationBar(font: UIFont?, color: UIColor){
        guard let font = font else {return}
        let attributes = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
    
    func settingsBBItemBack(text: String, color: UIColor){
        self.navigationItem.leftBarButtonItem?.title = text
        self.navigationItem.leftBarButtonItem?.tintColor = color
    }
    
}


extension UINavigationController {
    
    func popViewControllerWithHandler(completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: true)
        CATransaction.commit()
    }
    
    func pushViewController(viewController: UIViewController, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
    
    func fontBar(font: UIFont?, color: UIColor){
        var attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor : color]
        
        if let font = font {
            attributes[.font] = font
        }
        
        let NB = self.navigationBar
        
        if #available(iOS 13, *) {
            NB.standardAppearance.titleTextAttributes = attributes
        } else {
            NB.titleTextAttributes = attributes
        }
    }
    
    
    func clearBar(){
        
            let NB = self.navigationBar
        
//            NB.standardAppearance.backgroundColor = colorBacground //если сделать прозрачным, то по факту будет черным
            NB.standardAppearance.backgroundEffect = nil
            NB.standardAppearance.shadowImage = UIImage()
            NB.standardAppearance.shadowColor = .clear
            NB.standardAppearance.backgroundImage = UIImage()
       
        
    }
}
