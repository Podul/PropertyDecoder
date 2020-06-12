//
//  Models.swift
//  PropertyDecoder_Example
//
//  Created by Podul on 2019/12/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation


struct CustomStruct: Decodable {
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
    var k: URL
}

extension CustomStruct: CustomTypeProtocol {
    static var allTypes: [String: Any.Type] = [
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
        "k": URL.self
    ]
}


class CustomClass: Decodable {
    var a: String
    var b: Bool
    var c: Data
    var d: Date?
    var e: Int
    var f: UInt?
    var g: UInt64
    var h: Float?
    var i: Double
}

extension CustomClass: CustomTypeProtocol {
    static var allTypes: [String : Any.Type] = [
        "a": String.self,
        "b": Bool.self,
        "c": Data.self,
        "d": Date?.self,
        "e": Int.self,
        "f": UInt?.self,
        "g": UInt64.self,
        "h": Float?.self,
        "i": Double.self,
    ]
}

struct CustomContain: Decodable {
    var b: CustomStruct
    var d: CustomClass
    var e: CustomClass?
}

extension CustomContain: CustomTypeProtocol {
    static var allTypes: [String : Any.Type] = [
        "b": CustomStruct.self,
        "d": CustomClass.self,
        "e": CustomClass?.self,
    ]
}


struct Container: Decodable {
    var a: [String]
    var b: [Int]
    var c: [Data]
    var d: [CustomClass]
    var e: [CustomStruct]
    var f: [String: CustomClass]
    var g: [String: String]
}

extension Container: CustomTypeProtocol {
    static var allTypes: [String : Any.Type] = [
        "a": [String].self,
        "b": [Int].self,
        "c": [Data].self,
        "d": [CustomClass].self,
        "e": [CustomStruct].self,
        "f": [String: CustomClass].self,
        "g": [String: String].self
    ]
}
