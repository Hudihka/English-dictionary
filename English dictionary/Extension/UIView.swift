//
//  UIView.swift
//  trlnk-demo
//
//  Created by Админ on 02.09.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @objc func loadViewFromNib(_ name: String) -> UIView { //добавление вью созданной в ксиб файле
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: name, bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView {
            return view
        } else {
            return UIView()
        }
    }

    func addShadowTabBar(){
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: -4)
    }

    func roundedView(rect: UIRectCorner) { //закругление 2х углов вьюшки
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: rect, //[.topLeft, .bottomLeft]
            cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }

    func addRadius(number: CGFloat) {
        self.layer.cornerRadius = number
        self.layer.masksToBounds = true
    }

    func cirkleView() {
        let value = min(self.frame.height, self.frame.width)
        
        let radius = value / 2
        self.addRadius(number: radius)
    }

    var recurrenceAllSubviews: [UIView] {//получение всех UIView
        var all = [UIView]()
        func getSubview(view: UIView) {
            all.append(view)
            guard !view.subviews.isEmpty else {
                return
            }
            view.subviews.forEach { getSubview(view: $0) }
        }
        getSubview(view: self)

        return all
    }
    
    
    func ub_firstSubView<T: UIView>(ofType type: T.Type) -> T? {
        var resultView: T?
        for view in subviews {
            if let view = view as? T {
                resultView = view
                break
            }
            else {
                if let foundView = view.ub_firstSubView(ofType: T.self) {
                    resultView = foundView
                    break
                }
            }
        }
        return resultView
    }

    
    var recurrenceAllSubviewsZeroTag: [UIView] {//получение всех UIView
        return recurrenceAllSubviews.filter({$0.tag == 0})
    }
    
    
    func opasityAllViews(_ alpha: CGFloat) { //функция что выше но сразу делаем все прозрачным
        if alpha <= 1 && 0 <= alpha {
            var allViews = self.subviews
            allViews.append(self)
            for view in allViews {
                view.alpha = alpha
            }
        }
    }

    func setGradient(colorOne: UIColor, colorTwo: UIColor, pointOne: CGPoint, pointTwo: CGPoint) { //делает градиент на вьюшку по направлению
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = pointOne
        gradientLayer.endPoint = pointTwo

        layer.insertSublayer(gradientLayer, at: 0)
    }


    var screenshot: UIImage {
        if #available(iOS 10.0, *) {
            return UIGraphicsImageRenderer(size: bounds.size).image { _ in
                drawHierarchy(in: CGRect(origin: .zero, size: bounds.size), afterScreenUpdates: true)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
            drawHierarchy(in: self.bounds, afterScreenUpdates: true)
            let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
            UIGraphicsEndImageContext()
            return image
        }
    }
    
    func infinitiRotate(clockRotate: Bool, duratiuon: CFTimeInterval, key: String){
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        let toValue: Double = clockRotate ? 2 : -2
        rotation.toValue = toValue * Double.pi
        rotation.duration = duratiuon
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: key)
    }
    
    
    func getCut(with bezier: UIBezierPath) -> UIView {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezier.cgPath
        
        self.layer.mask = shapeLayer
        
        return self
    }
    
    func addShadow() {
        self.layer.masksToBounds = false
//        self.layer.shadowColor = colorBacground.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 11)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 10
    }
    
}
