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

    @IBOutlet weak var backButton: UIButton!
    
    let circle1 = CAShapeLayer();
    let circle2 = CAShapeLayer();
    let circle3 = CAShapeLayer();
    let circle4 = CAShapeLayer();
    let circle5 = CAShapeLayer();
    
    var chosen = "";
    var first = "";
    var second = "";
    var third = "";
    var fourth = "";
    

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
        circle1.path = UIBezierPath.init(ovalIn: CGRect(x: 65, y: 250, width: 114, height: 114)).cgPath;
        circle1.fillColor = hexStringToUIColor(hex: colors[3]).cgColor;
        circle1.opacity = 0.8;
        view.layer.addSublayer(circle1);
        
        circle2.path = UIBezierPath(ovalIn: CGRect(x: 138, y: 290, width: 192, height: 192)).cgPath;
        circle2.fillColor = hexStringToUIColor(hex: colors[0]).cgColor;
        circle2.opacity = 0.8;
        view.layer.addSublayer(circle2);
        
        circle3.path = UIBezierPath(ovalIn: CGRect(x: 281, y: 420, width: 81, height: 81)).cgPath;
        circle3.fillColor = hexStringToUIColor(hex: colors[4]).cgColor;
        circle3.opacity = 0.8;
        view.layer.addSublayer(circle3);
        
        circle4.path = UIBezierPath(ovalIn: CGRect(x: 78, y: 435, width: 145, height: 145)).cgPath;
        circle4.fillColor = hexStringToUIColor(hex: colors[1]).cgColor;
        circle4.opacity = 0.8;
        view.layer.addSublayer(circle4);
        
        circle5.path = UIBezierPath(ovalIn: CGRect(x: 180, y: 517, width: 120, height: 120)).cgPath;
        circle5.fillColor = hexStringToUIColor(hex: colors[2]).cgColor;
        circle5.opacity = 0.8;
        view.layer.addSublayer(circle5);
        
        let circleList = [circle1, circle2, circle3, circle4, circle5]
        for circle in circleList {
            circle.shadowColor = hexStringToUIColor(hex: "9F9F9F").cgColor;
            circle.shadowRadius = 2.0;
            circle.shadowOpacity = 0.8;
            circle.shadowOffset = CGSize(width: 0, height: 4);
        }
        
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        backButton.layer.shadowRadius = 2
        backButton.layer.shadowOpacity = 0.25
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch!.location(in: self.view)
        if circle1.path!.contains(point) {
            chosen = colors[3]
            first = colors[0]
            second = colors[1]
            third = colors[2]
            fourth = colors[4]
            performSegue(withIdentifier: "Colors", sender: self)
        } else if (circle2.path!.contains(point)) {
            chosen = colors[0]
            first = colors[1]
            second = colors[2]
            third = colors[3]
            fourth = colors[4]
            performSegue(withIdentifier: "Colors", sender: self)
        } else if (circle3.path!.contains(point)) {
            chosen = colors[4]
              first = colors[0]
              second = colors[1]
              third = colors[2]
              fourth = colors[3]
              performSegue(withIdentifier: "Colors", sender: self)
        } else if (circle4.path!.contains(point)) {
            chosen = colors[1]
              first = colors[0]
              second = colors[2]
              third = colors[3]
              fourth = colors[4]
              performSegue(withIdentifier: "Colors", sender: self)
        } else if (circle5.path!.contains(point)) {
            chosen = colors[2]
            first = colors[0]
            second = colors[1]
            third = colors[3]
            fourth = colors[4]
            performSegue(withIdentifier: "Colors", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : ThirdViewController = segue.destination as! ThirdViewController
        
        destVC.cirle1Color = chosen
        destVC.cirle2Color = first
        destVC.cirle3Color = second
        destVC.cirle4Color = third
        destVC.cirle5Color = fourth
}
}
