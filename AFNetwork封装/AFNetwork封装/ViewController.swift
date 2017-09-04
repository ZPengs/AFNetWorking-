//
//  ViewController.swift
//  AFNetwork封装
//
//  Created by ZPengs on 2017/8/31.
//  Copyright © 2017年 ZPengs. All rights reserved.
//

import UIKit
import AFNetworking
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typicaly from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NetworkTools.shareInstance.request(.GET, urlString: "http://httpbin.org/get", parameters: ["name" : "why" as AnyObject]) { (result, error) -> () in
            if error != nil {
                print(error ?? "11")
                return
            }
            print(result ?? "22")
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

