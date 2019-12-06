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
        
        do {
            let list = try Test.decodeProperties()
            _ = list.map{ print($0) }
        }catch {
            print(error)
        }
        
        
        
        
    }
}

struct Test: Decodable {
    let a: String
    let b: Int
    let c: Int?
    let d: String?
    let f: Data
    let arr: [String]
    let dict: [String: SubTest]
    let test: SubTest
}


struct SubTest: Decodable {
    let sub: String?
}
