//
//  ViewController.swift
//  PropertyDecoder
//
//  Created by podul on 12/06/2019.
//  Copyright (c) 2019 podul. All rights reserved.
//

import UIKit
import PropertyDecoder

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let list = try! Property.decode(Test.self)
        _ = list.map{print($0)}
    }
}

struct Test: Decodable {
    let a: String
    let b: Int
    let c: Int?
    let d: String?
    let f: Data
}
