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
protocol _AnyDecodable where Self: Property.Decodable {
    static func anyValue() -> Self
}

// MARK: - Number Value
extension Int: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}
extension Int8: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}
extension Int16: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}
extension Int32: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}
extension Int64: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}

extension UInt: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}
extension UInt8: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}
extension UInt16: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}
extension UInt32: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}
extension UInt64: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}

extension Float: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}
extension Double: _AnyDecodable {
    static func anyValue() -> Self { Self(0) }
}


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
    static func anyValue() -> URL { URL(string: "https://podul.icu")! }
}
