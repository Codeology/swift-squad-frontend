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

public var colors = [String]()
public var percentages = [Float]()

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

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    struct colorList: Decodable {
        let colors: [String]
        let percentages: [Float]
    }

    @IBOutlet weak var vscodeology: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var cameras: UIButton!
    @IBOutlet weak var photos: UIButton!
    
    @IBAction func openCameraButton(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.sourceType = .camera;
            cameraPicker.allowsEditing = false
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func openPhotoLibraryButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photo = UIImagePickerController()
            photo.delegate = self
            photo.sourceType = .photoLibrary;
            photo.allowsEditing = true
            self.present(photo, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage

        if let possibleImage = info[.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[.originalImage] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }

        // do something interesting here!
        let imageData = newImage.jpegData(compressionQuality: 0.5)
        let endpointUrl: String = "http://127.0.0.1:5000/endpoint"
        
        hideElements()
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        view.addSubview(activityIndicator)
        activityIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5);
        activityIndicator.center = CGPoint(x: view.frame.size.width * 0.5, y: view.frame.size.height * 0.5)
        activityIndicator.startAnimating()
        
        AF.upload(
            multipartFormData: { formData in
                      formData.append(imageData!, withName: "image", fileName: "image.jpg", mimeType: "image/jpg")
                  },
                  to: endpointUrl
            
        ).responseDecodable(of: colorList.self) { response in
            debugPrint(response)
            colors = response.value?.colors ?? ["none"]
            percentages = response.value?.percentages ?? [0.0]
            
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            
            self.dismiss(animated: false, completion: nil)
            self.performSegue(withIdentifier: "circlesSegue", sender: self)
            self.showElements()
        }
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        drawCirclesAndButtons();
    }
    
    func hideElements() {
        vscodeology.isHidden = true
        text.isHidden = true
        cameras.isHidden = true
        photos.isHidden = true
    }
    
    func showElements() {
        vscodeology.isHidden = false
        text.isHidden = false
        cameras.isHidden = false
        photos.isHidden = false
    }
    
    func drawCirclesAndButtons() {
        let circleLayer1 = CAShapeLayer();
        circleLayer1.path = UIBezierPath(ovalIn: CGRect(x: 200, y: 290, width: 190, height: 190)).cgPath;
        view.layer.addSublayer(circleLayer1);
        circleLayer1.fillColor = hexStringToUIColor(hex: "D1E5AA").cgColor;
        circleLayer1.opacity = 0.8
        
        let circleLayer2 = CAShapeLayer();
        circleLayer2.path = UIBezierPath(ovalIn: CGRect(x: 254, y: 237, width: 24, height: 24)).cgPath;
        view.layer.addSublayer(circleLayer2);
        circleLayer2.fillColor = hexStringToUIColor(hex: "99cc99").cgColor;
        circleLayer2.opacity = 0.8
        
        let circleLayer3 = CAShapeLayer();
        circleLayer3.path = UIBezierPath(ovalIn: CGRect(x: 60, y: 100, width: 71, height: 71)).cgPath;
        view.layer.addSublayer(circleLayer3);
        circleLayer3.fillColor = hexStringToUIColor(hex: "D1E5AA").cgColor;
        circleLayer3.opacity = 0.8
        
        let circleLayer4 = CAShapeLayer();
        circleLayer4.path = UIBezierPath(ovalIn: CGRect(x: 335, y: -5, width: 114, height: 114)).cgPath;
        view.layer.addSublayer(circleLayer4);
        circleLayer4.fillColor = hexStringToUIColor(hex: "99cc99").cgColor;
        circleLayer4.opacity = 0.8
        
        let circleLayer5 = CAShapeLayer();
        circleLayer5.path = UIBezierPath(ovalIn: CGRect(x: -34, y: 500, width: 111, height: 111)).cgPath;
        view.layer.addSublayer(circleLayer5);
        circleLayer5.fillColor = hexStringToUIColor(hex: "99cc99").cgColor;
        circleLayer5.opacity = 0.8
        
        let circleLayer6 = CAShapeLayer();
        circleLayer6.path = UIBezierPath(ovalIn: CGRect(x: 105, y: 670, width: 125, height: 125)).cgPath;
        view.layer.addSublayer(circleLayer6);
        circleLayer6.fillColor = hexStringToUIColor(hex: "D1E5AA").cgColor;
        circleLayer6.opacity = 0.8
        
        let circleLayer7 = CAShapeLayer();
        circleLayer7.path = UIBezierPath(ovalIn: CGRect(x: 350, y: 875, width: 28, height: 28)).cgPath;
        view.layer.addSublayer(circleLayer7);
        circleLayer7.fillColor = hexStringToUIColor(hex: "99cc99").cgColor;
        circleLayer7.opacity = 0.8
        
        cameras.layer.shadowColor = UIColor.black.cgColor
        cameras.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        cameras.layer.shadowRadius = 2
        cameras.layer.shadowOpacity = 0.25
        cameras.layer.cornerRadius = 20.0
        
        view.bringSubviewToFront(cameras)
        view.bringSubviewToFront(photos)
        
        photos.layer.shadowColor = UIColor.black.cgColor
        photos.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        photos.layer.shadowRadius = 2
        photos.layer.shadowOpacity = 0.25
        photos.layer.cornerRadius = 20.0

        // HTTP TEST:
//        AF.request("http://127.0.0.1:5000/endpoint").response { response in
//            debugPrint(response)
//        }
    }
}
