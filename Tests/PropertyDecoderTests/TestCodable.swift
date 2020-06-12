//
//  TestCodable.swift
//  PropertyDecoder_Tests
//
//  Created by Podul on 2019/12/8.
//  Copyright © 2019 CocoaPods. All rights reserved.
//  支持 Codable 的系统类型测试


class TestCoable: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSystemType() {
        _ = try! Property.decode(String.self)
        _ = try! Property.decode(Bool.self)
        _ = try! Property.decode(Data.self)
        _ = try! Property.decode(Date.self)
        _ = try! Property.decode(Int.self)
        _ = try! Property.decode(Int8?.self)
        _ = try! Property.decode(Int16.self)
        _ = try! Property.decode(Int32?.self)
        _ = try! Property.decode(Int64.self)
        _ = try! Property.decode(UInt.self)
        _ = try! Property.decode(UInt8.self)
        _ = try! Property.decode(UInt16.self)
        _ = try! Property.decode(UInt32.self)
        _ = try! Property.decode(UInt64.self)
        _ = try! Property.decode(Float.self)
        _ = try! Property.decode(Double.self)
    }
    
    func testArrayType() {
        _ = try! Property.decode([String].self)
        _ = try! Property.decode([Bool].self)
        _ = try! Property.decode([Data].self)
        _ = try! Property.decode([Date].self)
        _ = try! Property.decode([Int].self)
        _ = try! Property.decode([Int8].self)
        _ = try! Property.decode([Int16].self)
        _ = try! Property.decode([Int32].self)
        _ = try! Property.decode([Int64].self)
        _ = try! Property.decode([UInt].self)
        _ = try! Property.decode([UInt8].self)
        _ = try! Property.decode([UInt16].self)
        _ = try! Property.decode([UInt32].self)
        _ = try! Property.decode([UInt64].self)
        _ = try! Property.decode([Float]?.self)
        _ = try! Property.decode([Double].self)
    }
    
    func testDictionaryType() {
        _ = try! Property.decode([String: String].self)
        _ = try! Property.decode([String: Bool].self)
        _ = try! Property.decode([String: Data].self)
        _ = try! Property.decode([String: Date].self)
        _ = try! Property.decode([String: Int].self)
        _ = try! Property.decode([String: Int8].self)
        _ = try! Property.decode([String: Int16].self)
        _ = try! Property.decode([String: Int32].self)
        _ = try! Property.decode([String: Int64].self)
        _ = try! Property.decode([String: UInt].self)
        _ = try! Property.decode([String: UInt8].self)
        _ = try! Property.decode([String: UInt16].self)
        _ = try! Property.decode([String: UInt32].self)
        _ = try! Property.decode([String: UInt64].self)
        _ = try! Property.decode([String: Float].self)
        _ = try! Property.decode([String: Double].self)
    }
}

