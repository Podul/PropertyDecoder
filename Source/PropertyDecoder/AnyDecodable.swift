//
//  AnyDecodable.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation
/// ```
/// _AnyDecodable now supports
/// Bool, String, Data, Array, Dictionary, Date
/// Double, Float,
/// Int, Int8, Int16, Int32, Int64, UInt, UInt8, UInt16, UInt32, UInt64
/// ```


// MARK: - 对外
public protocol AnyDecodable where Self: Property.Decodable {
    static func defaultValue() -> Self
}



// MARK: - 对内
protocol _AnyDecodable where Self: Property.Decodable {
    static func defaultValue() -> Any
}

// MARK: - Number Value
fileprivate protocol _NumberDecodable: _AnyDecodable {}
extension _NumberDecodable {
    static func defaultValue() -> Any { 0 }
}

extension Int: _NumberDecodable {}
extension Int8: _NumberDecodable {}
extension Int16: _NumberDecodable {}
extension Int32: _NumberDecodable {}
extension Int64: _NumberDecodable {}

extension UInt: _NumberDecodable {}
extension UInt8: _NumberDecodable {}
extension UInt16: _NumberDecodable {}
extension UInt32: _NumberDecodable {}
extension UInt64: _NumberDecodable {}

extension Float: _NumberDecodable {}
extension Double: _NumberDecodable {}


// MARK: - Other Value
extension String: _AnyDecodable {
    static func defaultValue() -> Any { "0" }
}

extension Data: _AnyDecodable {
    static func defaultValue() -> Any { Data() }
}

extension Bool: _AnyDecodable {
    static func defaultValue() -> Any { false }
}

extension Array: _AnyDecodable where Element: _AnyDecodable {
    static func defaultValue() -> Any { [] }
}

extension Dictionary: _AnyDecodable where Key: _AnyDecodable, Value: _AnyDecodable {
    static func defaultValue() -> Any { [:] }
}

extension Date: _AnyDecodable {
    static func defaultValue() -> Any { Date() }
}
