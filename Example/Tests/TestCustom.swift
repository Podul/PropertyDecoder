//
//  TestCustom.swift
//  PropertyDecoder_Tests
//
//  Created by Podul on 2019/12/8.
//  Copyright © 2019 CocoaPods. All rights reserved.
//  自定义类型测试

class TestCustom: XCTestCase {
    func testStruct() {
        let list = try! Property.decode(CustomStruct.self)
        
        let keys = CustomStruct.allTypes.keys.sorted { $0 < $1 }
        for (i, key) in keys.enumerated() {
            let value = CustomStruct.allTypes[key]!
            assert(key == list[i].label)
            assert(value == list[i].valueType)
        }
    }
    
    func testClass() {
        let list = try! Property.decode(CustomClass.self)
        
        let keys = CustomClass.allTypes.keys.sorted { $0 < $1 }
        for (i, key) in keys.enumerated() {
            let value = CustomClass.allTypes[key]!
            assert(key == list[i].label)
            assert(value == list[i].valueType)
        }
    }
    
    func testSub() {
        let list = try! Property.decode(CustomContain.self)
        
        let keys = CustomContain.allTypes.keys.sorted { $0 < $1 }
        for (i, key) in keys.enumerated() {
            let value = CustomContain.allTypes[key]!
            assert(key == list[i].label)
            assert(value == list[i].valueType)
        }
    }
}



