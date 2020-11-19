//
//  ViewController.swift
//  vsco-front-end
//
//  Created by Kyle Hua on 10/19/20.
//  Copyright © 2020 Kyle Hua. All rights reserved.
//
import Alamofire
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://127.0.0.1:5000/endpoint").response { response in
                    debugPrint(response)
                }
        // Do any additional setup after loading the view.
    }


}

