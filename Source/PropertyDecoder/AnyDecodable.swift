//
//  AnyDecodable.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation
/// ```
/// AnyDecodable now supports
/// Bool, String, Data, Array, Dictionary, Date
/// Double, Float,
/// Int, Int8, Int16, Int32, Int64, UInt, UInt8, UInt16, UInt32, UInt64
/// ```
protocol AnyDecodable where Self: Property.Decodable {
    static func anyValue() -> Any
}


// MARK: - Number Value
protocol NumberDecodable: AnyDecodable {}
extension NumberDecodable {
    static func anyValue() -> Any { 0 }
}

extension Int: NumberDecodable {}
extension Int8: NumberDecodable {}
extension Int16: NumberDecodable {}
extension Int32: NumberDecodable {}
extension Int64: NumberDecodable {}

extension UInt: NumberDecodable {}
extension UInt8: NumberDecodable {}
extension UInt16: NumberDecodable {}
extension UInt32: NumberDecodable {}
extension UInt64: NumberDecodable {}

extension Float: NumberDecodable {}
extension Double: NumberDecodable {}


// MARK: - Other Value
extension String: AnyDecodable {
    static func anyValue() -> Any { "0" }
}

extension Data: AnyDecodable {
    static func anyValue() -> Any { Data() }
}

extension Bool: AnyDecodable {
    static func anyValue() -> Any { false }
}

extension Array: AnyDecodable where Element: AnyDecodable {
    static func anyValue() -> Any { [] }
}

extension Dictionary: AnyDecodable where Key: AnyDecodable, Value: AnyDecodable {
    static func anyValue() -> Any { [:] }
}

extension Date: AnyDecodable {
    static func anyValue() -> Any { Date() }
}
