//
//  TestCustom.swift
//  PropertyDecoder_Tests
//
//  Created by Podul on 2019/12/8.
//  Copyright © 2019 CocoaPods. All rights reserved.
//  自定义类型测试

struct TestStruct: Decodable {
    var a: String
    var b: String?
    var c: Bool
    var d: Data
    var e: Date
    var f: Int?
    var g: UInt16
    var h: UInt64
    var i: Float
    var j: Double
    var k: [String]
    var l: [Data]?
    
    static let allType: [String: Any.Type] = {
        [
            "a": String.self,
            "b": String?.self,
            "c": Bool.self,
            "d": Data.self,
            "e": Date.self,
            "f": Int?.self,
            "g": UInt16.self,
            "h": UInt64.self,
            "i": Float.self,
            "j": Double.self,
            "k": [String].self,
            "l": [Data]?.self
        ]
    }()
        
}

class TestClass: Decodable {
    var a: String
    var b: Bool
    var c: Data
    var d: Date?
    var e: Int
    var f: UInt?
    var g: UInt64
    var h: Float?
    var i: Double
    var j: [Float]
    var k: [UInt]?
    
    static let allType: [String: Any.Type] = {
        [
            "a": String.self,
            "b": Bool.self,
            "c": Data.self,
            "d": Date?.self,
            "e": Int.self,
            "f": UInt?.self,
            "g": UInt64.self,
            "h": Float?.self,
            "i": Double.self,
            "j": [Float].self,
            "k": [UInt]?.self
        ]
    }()
}

struct ContainsSub: Decodable {
    var a: String?
    var b: TestStruct
    var c: [TestStruct]
    var d: TestClass
    var e: TestClass?
    var f: [String: TestStruct]
    var g: [String: TestClass]
    
    static let allType: [String: Any.Type] = {
        [
            "a": String?.self,
            "b": TestStruct.self,
            "c": [TestStruct].self,
            "d": TestClass.self,
            "e": TestClass?.self,
            "f": [String: TestStruct].self,
            "g": [String: TestClass].self
        ]
    }()
}

class TestCustom: XCTestCase {
    func testStruct() {
        let list = try! Property.decode(TestStruct.self)
        
        let keys = TestStruct.allType.keys.sorted { $0 < $1 }
        for (i, key) in keys.enumerated() {
            let value = TestStruct.allType[key]!
            assert(key == list[i].label)
            assert(value == list[i].valueType)
        }
    }
    
    func testClass() {
        let list = try! Property.decode(TestClass.self)
        
        let keys = TestClass.allType.keys.sorted { $0 < $1 }
        for (i, key) in keys.enumerated() {
            let value = TestClass.allType[key]!
            assert(key == list[i].label)
            assert(value == list[i].valueType)
        }
    }
    
    func testSub() {
        let list = try! Property.decode(ContainsSub.self)
        
        let keys = ContainsSub.allType.keys.sorted { $0 < $1 }
        for (i, key) in keys.enumerated() {
            let value = ContainsSub.allType[key]!
            assert(key == list[i].label)
            assert(value == list[i].valueType)
        }
    }
}

