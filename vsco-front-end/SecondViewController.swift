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

    let circle1 = CAShapeLayer();
    let circle2 = CAShapeLayer();
    let circle3 = CAShapeLayer();
    let circle4 = CAShapeLayer();
    let circle5 = CAShapeLayer();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawCircles()
    }
    
    func drawCircles() {
        circle1.path = UIBezierPath.init(ovalIn: CGRect(x: 65, y: 240, width: 114, height: 114)).cgPath;
        circle1.fillColor = hexStringToUIColor(hex: "FE9B74").cgColor;
        circle1.opacity = 0.8;
        view.layer.addSublayer(circle1);
        
        circle2.path = UIBezierPath(ovalIn: CGRect(x: 138, y: 290, width: 192, height: 192)).cgPath;
        view.layer.addSublayer(circle2);
        circle2.fillColor = hexStringToUIColor(hex: "2D2428").cgColor
        circle2.opacity = 0.8
        
        circle3.path = UIBezierPath(ovalIn: CGRect(x: 281, y: 420, width: 81, height: 81)).cgPath;
        view.layer.addSublayer(circle3);
        circle3.fillColor = hexStringToUIColor(hex: "E5AFA5").cgColor
        circle3.opacity = 0.8
        
        circle4.path = UIBezierPath(ovalIn: CGRect(x: 78, y: 430, width: 145, height: 145)).cgPath;
        view.layer.addSublayer(circle4);
        circle4.fillColor = hexStringToUIColor(hex: "413F58").cgColor
        circle4.opacity = 0.8
        
        circle5.path = UIBezierPath(ovalIn: CGRect(x: 175, y: 512, width: 120, height: 120)).cgPath;
        view.layer.addSublayer(circle5);
        circle5.fillColor = hexStringToUIColor(hex: "898198").cgColor
        circle5.opacity = 0.8
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch!.location(in: self.view)
        if circle1.path!.contains(point) {
            print ("We tapped the circle1")
        } else if (circle2.path!.contains(point)) {
            print ("We tapped the circle2")
        } else if (circle3.path!.contains(point)) {
            print ("We tapped the circle3")
        } else if (circle4.path!.contains(point)) {
            print ("We tapped the circle4")
        } else if (circle5.path!.contains(point)) {
            print ("We tapped the circle5")
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
