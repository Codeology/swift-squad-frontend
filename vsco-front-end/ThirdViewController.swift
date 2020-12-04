
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
    
       var cirle1Color :String = ""
       var cirle2Color :String = ""
       var cirle3Color :String = ""
       var cirle4Color :String = ""
       var cirle5Color :String = ""
       
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
           //loadImage()
       }

       func drawCircles() {
             circle1.path = UIBezierPath.init(ovalIn: CGRect(x: 65, y: 240, width: 102, height: 102)).cgPath;
             circle1.fillColor = hexStringToUIColor(hex: cirle1Color).cgColor;
             circle1.opacity = 1;
             view.layer.addSublayer(circle1);
             
             circle2.path = UIBezierPath(ovalIn: CGRect(x: 74, y: 520, width: 79, height: 79)).cgPath;
             view.layer.addSublayer(circle2);
             circle2.fillColor = hexStringToUIColor(hex: cirle2Color).cgColor
             circle2.opacity = 1
             
             circle3.path = UIBezierPath(ovalIn: CGRect(x: 74, y: 666, width: 79, height: 79)).cgPath;
             view.layer.addSublayer(circle3);
             circle3.fillColor = hexStringToUIColor(hex: cirle3Color).cgColor
             circle3.opacity = 1
             
             circle4.path = UIBezierPath(ovalIn: CGRect(x: 212, y: 520, width: 79, height: 79)).cgPath;
             view.layer.addSublayer(circle4);
             circle4.fillColor = hexStringToUIColor(hex: cirle4Color).cgColor
             circle4.opacity = 1
             
             circle5.path = UIBezierPath(ovalIn: CGRect(x: 212, y: 666, width: 79, height: 79)).cgPath;
             view.layer.addSublayer(circle5);
             circle5.fillColor = hexStringToUIColor(hex: cirle5Color).cgColor
             circle5.opacity = 1
         }
       
       func genText() {
           let selected = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            selected.center = CGPoint(x: 220, y: 285)
            selected.textAlignment = .center
            selected.text = cirle1Color
            
           
           let c1 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           c1.center = CGPoint(x: 115, y: 500)
           c1.textAlignment = .center
           c1.text = cirle2Color
           
           let c2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           c2.center = CGPoint(x: 115, y: 646)
           c2.textAlignment = .center
           c2.text = cirle3Color
           
           let c3 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           c3.center = CGPoint(x: 252, y: 500)
           c3.textAlignment = .center
           c3.text = cirle4Color
           
           let c4 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
           c4.center = CGPoint(x: 252, y: 646)
           c4.textAlignment = .center
           c4.text = cirle4Color
           
           self.view.addSubview(selected)
           self.view.addSubview(c1)
           self.view.addSubview(c2)
           self.view.addSubview(c3)
           self.view.addSubview(c4)
       }
       
       func loadImage(){
           let imageName = "yourImage.png"
           let image = UIImage(named: imageName)
           let imageView = UIImageView(image: image!)
           imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
           view.addSubview(imageView)
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
    
    @IBAction func backButtonPressed(_ sender: Any) {
           dismiss(animated: true, completion: nil)
       }
    
}
