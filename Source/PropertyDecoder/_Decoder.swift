//
//  _Decoder.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation


/// From `Vapor` [Core/CodableReflection/CodableReflection.swift](https://github.com/vapor/core/blob/master/Sources/Core/CodableReflection/ReflectionDecoders.swift)
struct _Decoder {
    
    var codingPath: [CodingKey]
    var userInfo: [CodingUserInfoKey: Any] = [:]
    
    init(codingPath: [CodingKey] = []) {
        self.codingPath = codingPath
    }
}

extension _Decoder: Decoder {
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        .init(_KeyedDecodingContainer(codingPath: codingPath))
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        _UnkeyedDecodingContainer(codingPath: codingPath)
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        _SingleValueDecodingContainer(codingPath: codingPath)
    }
    
}

// MARK: - SingleValueDecodingContainer
fileprivate struct _SingleValueDecodingContainer: SingleValueDecodingContainer {
    var codingPath: [CodingKey]
    
    func decodeNil() -> Bool { true }
    
    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        guard let result = try type._defaultValue() as? T else {
            throw _DecoderError(message: "\(type) not as Decodable")
        }
        return result
    }
}

/// Untest
// MARK: - _UnkeyedDecodingContainer
fileprivate struct _UnkeyedDecodingContainer: UnkeyedDecodingContainer {
    var codingPath: [CodingKey]
    
    var count: Int?
    
    var isAtEnd: Bool = false
    
    var currentIndex: Int = 0
    
    init(codingPath: [CodingKey]) {
        self.codingPath = codingPath
    }
    
    mutating func decodeNil() throws -> Bool {
        isAtEnd = true
        return true
    }
    
    mutating func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        if let result = try? type._defaultValue(), let resultT = result as? T {
            isAtEnd = true
            return resultT
        }
        return try T(from: superDecoder())
    }
    
    mutating func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        .init(_KeyedDecodingContainer(codingPath: codingPath))
    }
    
    mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        _UnkeyedDecodingContainer(codingPath: codingPath)
    }
    
    mutating func superDecoder() throws -> Decoder {
        _Decoder(codingPath: codingPath)
    }
    
}


// MARK: - _KeyedDecodingContainer
fileprivate struct _KeyedDecodingContainer<K>: KeyedDecodingContainerProtocol where K: CodingKey {
    typealias Key = K

    var codingPath: [CodingKey]
    var allKeys: [K] = []
    
    init(codingPath: [CodingKey]) {
        self.codingPath = codingPath
    }
    
    func contains(_ key: K) -> Bool { true }
    
    func decodeNil(forKey key: K) throws -> Bool { false }
 
    func decode<T>(_ type: T.Type, forKey key: K) throws -> T where T : Decodable {
        if let result = try? type._defaultValue(), let resultT = result as? T {
            return resultT
        }
        return try T(from: superDecoder(forKey: key))
    }
    
    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        .init(_KeyedDecodingContainer<NestedKey>(codingPath: codingPath + [key]))
    }
    
    func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        _UnkeyedDecodingContainer(codingPath: codingPath + [key])
    }
    
    func superDecoder() throws -> Decoder {
        _Decoder(codingPath: codingPath)
    }
    
    func superDecoder(forKey key: K) throws -> Decoder {
        _Decoder(codingPath: codingPath + [key])
    }
    
}


// MARK: - extension Decodable
fileprivate extension Decodable {
    static func _defaultValue() throws -> Any {
        guard let asable = Self.self as? _AnyDecodable.Type else {
            throw _DecoderError(message: "not support type \(Self.self)")
        }
        return asable.anyValue()
    }
}


// MARK: - _DecoderError
fileprivate struct _DecoderError: Error {
    let message: String
    let file: String
    let line: Int
    
    init(message: String, file: String = #file, line: Int = #line) {
        self.message = message
        self.file = file
        self.line = line
    }
}


