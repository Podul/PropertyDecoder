//
//  TestContainer.swift
//  PropertyDecoder_Tests
//
//  Created by Podul on 2019/12/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest

class TestContainer: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testContainer() {
        
        let list = try! Property.decode(Container.self)
        
        let keys = Container.allTypes.keys.sorted { $0 < $1 }
        for (i, key) in keys.enumerated() {
            let value = Container.allTypes[key]!
            assert(key == list[i].label)
            assert(value == list[i].valueType)
        }
    }
}

