//
//  Property.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation


public protocol EnumCodable: AnyDecodable, Encodable {}

//extension EnumCodable {
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        guard let value = Self.init(rawValue:try container.decode(RawValue.self)) else {
//            throw NSError(domain: "me.podul.EnumCodable", code: -1)
//        }
//        self = value
//    }
//}


public enum Property {
    public typealias Decodable = Swift.Decodable
    
    /// 字段信息
    public struct Field {
        /// 字段名
        public let label: String
        /// 字段类型
        public let valueType: Any.Type
        
        fileprivate init(label: String, valueType: Any.Type) {
            self.label = label
            self.valueType = valueType
        }
    }
    
    /// 字段解析
    public static func decode<T>(_ aType: T.Type) throws -> [Field] where T: Decodable {
        let model = try T(from: _Decoder())
        
        let mirror = Mirror(reflecting: model)
        var fields = [Field]()
        for (label, value) in mirror.children {
            guard let label = label else { continue }
            fields.append(Field(label: label, valueType: type(of: value)))
        }
        return fields
    }
}

extension Property.Field: CustomStringConvertible {
    public var description: String {
        return "{label: \(label), type: \(valueType)}"
    }
}
