//
//  SecondViewController.swift
//  vsco-front-end
//
//  Created by Haotian Ye on 10/25/20.
//  Copyright © 2020 Kyle Hua. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawCircles()
    }
    
    func drawCircles() {
        let circle1 = CAShapeLayer();
//        circle1.anchorPoint = CGPoint.zero
        circle1.path = UIBezierPath.init(ovalIn: CGRect(x: 65, y: 240, width: 114, height: 114)).cgPath;
        circle1.fillColor = hexStringToUIColor(hex: "FE9B74").cgColor;
        circle1.opacity = 0.8;
//        circle1.bounds = (circle1.path?.boundingBox)!;
        view.layer.addSublayer(circle1);
        
        let circle2 = CAShapeLayer();
        circle2.path = UIBezierPath(ovalIn: CGRect(x: 138, y: 290, width: 192, height: 192)).cgPath;
        view.layer.addSublayer(circle2);
        circle2.fillColor = hexStringToUIColor(hex: "2D2428").cgColor
        circle2.opacity = 0.8
        
        let circle3 = CAShapeLayer();
        circle3.path = UIBezierPath(ovalIn: CGRect(x: 281, y: 420, width: 81, height: 81)).cgPath;
        view.layer.addSublayer(circle3);
        circle3.fillColor = hexStringToUIColor(hex: "E5AFA5").cgColor
        circle3.opacity = 0.8
        
        let circle4 = CAShapeLayer();
        circle4.path = UIBezierPath(ovalIn: CGRect(x: 78, y: 430, width: 145, height: 145)).cgPath;
        view.layer.addSublayer(circle4);
        circle4.fillColor = hexStringToUIColor(hex: "413F58").cgColor
        circle4.opacity = 0.8
        
        let circle5 = CAShapeLayer();
        circle5.path = UIBezierPath(ovalIn: CGRect(x: 175, y: 512, width: 120, height: 120)).cgPath;
        view.layer.addSublayer(circle5);
        circle5.fillColor = hexStringToUIColor(hex: "898198").cgColor
        circle5.opacity = 0.8
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view) // Where you pressed

        if let layer = self.view.layer.hitTest(point!) as? CAShapeLayer { // If you hit a layer and if its a Shapelayer
            if (layer.path?.contains(point!))! { // Optional, if you are inside its content path
                print("Hit shapeLayer") // Do something
            }
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
