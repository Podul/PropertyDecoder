//
//  AnyDecodable.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation
/// ```
/// _AnyDecodable now supports
/// Bool, String, Data, Array, Dictionary, Date, URL
/// Double, Float
/// Int, Int8, Int16, Int32, Int64, UInt, UInt8, UInt16, UInt32, UInt64
/// ```

public protocol AnyDecodable: Property.Decodable {
    static func anyValue() -> Self
}

protocol _AnyDecodable: Property.Decodable {
    static func anyValue() -> Self
}

// MARK: - Number Value
protocol _NumberDecodable: _AnyDecodable {}
protocol _IntDecodable: _NumberDecodable {}
protocol _FloatDecodable: _NumberDecodable {}

extension _IntDecodable where Self: ExpressibleByIntegerLiteral {
    static func anyValue() -> Self { 0 }
}

extension _FloatDecodable where Self: ExpressibleByFloatLiteral {
    static func anyValue() -> Self { 0.0 }
}

extension Int: _IntDecodable {}
extension Int8: _IntDecodable {}
extension Int16: _IntDecodable {}
extension Int32: _IntDecodable {}
extension Int64: _IntDecodable {}
extension UInt: _IntDecodable {}
extension UInt8: _IntDecodable {}
extension UInt16: _IntDecodable {}
extension UInt32: _IntDecodable {}
extension UInt64: _IntDecodable {}

extension Float: _FloatDecodable {}
//extension Float80: _FloatDecodable {}
extension Double: _FloatDecodable {}

// MARK: - Other Value
extension String: _AnyDecodable {
    static func anyValue() -> Self { "0" }
}

extension Data: _AnyDecodable {
    static func anyValue() -> Self { Data() }
}

extension Bool: _AnyDecodable {
    static func anyValue() -> Self { false }
}

extension Array: _AnyDecodable where Element: Decodable {
    static func anyValue() -> Self { [] }
}

extension Dictionary: _AnyDecodable where Key: Decodable, Value: Decodable {
    static func anyValue() -> Self { [:] }
}

extension Date: _AnyDecodable {
    static func anyValue() -> Self { Date() }
}

extension URL: _AnyDecodable {
    static func anyValue() -> URL { URL(string: "https://podul.me")! }
}
