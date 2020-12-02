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
    
    // Go back to home page
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func drawCircles() {
        circle1.path = UIBezierPath.init(ovalIn: CGRect(x: 65, y: 240, width: 114, height: 114)).cgPath;
        circle1.fillColor = hexStringToUIColor(hex: colors[0]).cgColor;
        circle1.opacity = 0.8;
        circle1.shadowColor = hexStringToUIColor(hex: "9F9F9F").cgColor;
        circle1.shadowRadius = 2.0;
        circle1.shadowOpacity = 0.8;
        circle1.shadowOffset = CGSize(width: 0, height: 4);
        view.layer.addSublayer(circle1);
        
        circle2.path = UIBezierPath(ovalIn: CGRect(x: 138, y: 290, width: 192, height: 192)).cgPath;
        circle2.fillColor = hexStringToUIColor(hex: colors[1]).cgColor;
        circle2.opacity = 0.8;
        circle2.shadowColor = hexStringToUIColor(hex: "9F9F9F").cgColor;
        circle2.shadowRadius = 2.0;
        circle2.shadowOpacity = 0.8;
        circle2.shadowOffset = CGSize(width: 0, height: 4);
        view.layer.addSublayer(circle2);
        
        circle3.path = UIBezierPath(ovalIn: CGRect(x: 281, y: 420, width: 81, height: 81)).cgPath;
        circle3.fillColor = hexStringToUIColor(hex: colors[2]).cgColor;
        circle3.opacity = 0.8;
        circle3.shadowColor = hexStringToUIColor(hex: "9F9F9F").cgColor;
        circle3.shadowRadius = 2.0;
        circle3.shadowOpacity = 0.8;
        circle3.shadowOffset = CGSize(width: 0, height: 4);
        view.layer.addSublayer(circle3);
        
        circle4.path = UIBezierPath(ovalIn: CGRect(x: 78, y: 430, width: 145, height: 145)).cgPath;
        circle4.fillColor = hexStringToUIColor(hex: colors[3]).cgColor;
        circle4.opacity = 0.8;
        circle4.shadowColor = hexStringToUIColor(hex: "9F9F9F").cgColor;
        circle4.shadowRadius = 2.0;
        circle4.shadowOpacity = 0.8;
        circle4.shadowOffset = CGSize(width: 0, height: 4);
        view.layer.addSublayer(circle4);
        
        circle5.path = UIBezierPath(ovalIn: CGRect(x: 175, y: 512, width: 120, height: 120)).cgPath;
        circle5.fillColor = hexStringToUIColor(hex: colors[4]).cgColor;
        circle5.opacity = 0.8;
        circle5.shadowColor = hexStringToUIColor(hex: "9F9F9F").cgColor;
        circle5.shadowRadius = 2.0;
        circle5.shadowOpacity = 0.8;
        circle5.shadowOffset = CGSize(width: 0, height: 4);
        view.layer.addSublayer(circle5);
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
}
