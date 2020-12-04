
//
//  ViewController.swift
//  vsco-front-end
//
//  Created by Kyle Hua on 10/19/20.
//  Copyright © 2020 Kyle Hua. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class ThirdViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
        var circle1Color :String = ""
       var circle2Color :String = ""
       var circle3Color :String = ""
       var circle4Color :String = ""
       var circle5Color :String = ""
       
       let circle1 = CAShapeLayer();
       let circle2 = CAShapeLayer();
       let circle3 = CAShapeLayer();
       let circle4 = CAShapeLayer();
       let circle5 = CAShapeLayer();
       
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
            genText()
            drawCircles()
           loadImage()
       }

       func drawCircles() {
             circle1.path = UIBezierPath.init(ovalIn: CGRect(x: 104, y: 272, width: 102, height: 102)).cgPath;
             circle1.fillColor = hexStringToUIColor(hex: circle1Color).cgColor;
             circle1.opacity = 1;
            circle1.shadowColor = hexStringToUIColor(hex: "9F9F9F").cgColor;
            circle1.shadowRadius = 2.0;
            circle1.shadowOpacity = 0.8;
            circle1.shadowOffset = CGSize(width: 0, height: 4);
             view.layer.addSublayer(circle1);
             
             circle2.path = UIBezierPath(ovalIn: CGRect(x: 102, y: 470, width: 79, height: 79)).cgPath;
             view.layer.addSublayer(circle2);
             circle2.fillColor = hexStringToUIColor(hex: circle2Color).cgColor
             circle2.opacity = 1
             
             circle3.path = UIBezierPath(ovalIn: CGRect(x: 102, y: 616, width: 79, height: 79)).cgPath;
             view.layer.addSublayer(circle3);
             circle3.fillColor = hexStringToUIColor(hex: circle3Color).cgColor
             circle3.opacity = 1
             
             circle4.path = UIBezierPath(ovalIn: CGRect(x: 240, y: 470, width: 79, height: 79)).cgPath;
             view.layer.addSublayer(circle4);
             circle4.fillColor = hexStringToUIColor(hex: circle4Color).cgColor
             circle4.opacity = 1
             
             circle5.path = UIBezierPath(ovalIn: CGRect(x: 240, y: 616, width: 79, height: 79)).cgPath;
             view.layer.addSublayer(circle5);
             circle5.fillColor = hexStringToUIColor(hex: circle5Color).cgColor
             circle5.opacity = 1
        
            backButton.layer.shadowColor = UIColor.black.cgColor
            backButton.layer.shadowOffset = CGSize(width: 0, height: 4.0)
            backButton.layer.shadowRadius = 2
            backButton.layer.shadowOpacity = 0.25
         }
       
       func genText() {
           let selected = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            selected.center = CGPoint(x: 264, y: 325)
            selected.textAlignment = .center
            selected.text = circle1Color
            selected.font = UIFont.boldSystemFont(ofSize: 20.0)
           
           let c1 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           c1.center = CGPoint(x: 143, y: 450)
           c1.textAlignment = .center
           c1.text = circle2Color
           
           let c2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           c2.center = CGPoint(x: 143, y: 596)
           c2.textAlignment = .center
           c2.text = circle3Color
           
           let c3 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           c3.center = CGPoint(x: 280, y: 450)
           c3.textAlignment = .center
           c3.text = circle3Color
           
           let c4 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           c4.center = CGPoint(x: 280, y: 596)
           c4.textAlignment = .center
           c4.text = circle4Color
           
           self.view.addSubview(selected)
           self.view.addSubview(c1)
           self.view.addSubview(c2)
           self.view.addSubview(c3)
           self.view.addSubview(c4)
       }
       
       func loadImage(){
           let image = imageUsed
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 250)
           view.addSubview(imageView)
       }
    
    @IBAction func backButtonPressed(_ sender: Any) {
           dismiss(animated: true, completion: nil)
       }
    
}
