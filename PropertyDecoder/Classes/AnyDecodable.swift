//
//  AnyDecodable.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation


protocol AnyDecodable: Decodable {
    static func anyValue() -> Any
}

extension String: AnyDecodable {
    static func anyValue() -> Any { "0" }
}



// MARK: - Number Value
protocol NumberDecodable: AnyDecodable {}
extension NumberDecodable {
    static func anyValue() -> Any { 0 }
}

extension Int: NumberDecodable {}
extension UInt8: NumberDecodable {}

extension Data: AnyDecodable {
    static func anyValue() -> Any {
        Data()
    }
}

extension Bool: AnyDecodable {
    static func anyValue() -> Any { false }
}

