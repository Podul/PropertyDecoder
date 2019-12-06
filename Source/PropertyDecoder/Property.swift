//
//  Property.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation

public enum Property {
    public typealias Decodable = Swift.Decodable
    
    /// 字段信息
    public struct Field {
        /// 字段名
        let label: String
        /// 字段类型
        let valueType: Any.Type
        /// 字段
//        let valueFields: [Field]
        
        init(label: String, valueType: Any.Type, valueFields: [Field] = []) {
            self.label = label
            self.valueType = valueType
//            self.valueFields = valueFields
        }
    }
    
    /// 字段解析（只会解一层）
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
    
    // MARK: - TODO
    /// 字段解析（递归解析）
//    public static func recursionDecode<T>(_ aType: T.Type) throws where T: Decodable {
//
//    }
}

extension Property.Field: CustomStringConvertible {
    public var description: String {
        return "{label: \(label), type: \(valueType)}"
    }
}
