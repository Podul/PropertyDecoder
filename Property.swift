//
//  PropertyDecoder.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation

public enum Property {
    public typealias Decodable = Swift.Decodable
    
    /// 字段信息
    public struct Field {
        let key: String
        let valueType: Any.Type
    }
    
    /// 字段解析
    public static func decode<T>(_ aType: T.Type) throws -> [Field] where T: Decodable {
        let model = try T(from: _Decoder())
        
        let mirror = Mirror(reflecting: model)
        var fields = [Field]()
        for (label, value) in mirror.children {
            guard let label = label else { continue }
            fields.append(Field(key: label, valueType: type(of: value)))
        }
        return fields
    }
}

extension Property.Field: CustomStringConvertible {
    public var description: String {
        return "{key: \(key), type: \(valueType)}"
    }
}
