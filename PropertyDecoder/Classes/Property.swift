//
//  PropertyDecoder.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation

public struct Property {
    public struct Field {
        let key: String
        let valueType: Any.Type
    }
    
    public struct Decoder {
        public static func decode<T>(_ aType: T.Type) throws -> [Field] where T : Decodable {
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
    
    let list: [Field] = []
}
