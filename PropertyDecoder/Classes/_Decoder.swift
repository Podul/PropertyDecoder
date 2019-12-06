//
//  _Decoder.swift
//  PropertyDecoder
//
//  Created by Podul on 2019/12/6.
//

import Foundation


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
struct _SingleValueDecodingContainer: SingleValueDecodingContainer {
    var codingPath: [CodingKey]
    
    func decodeNil() -> Bool { true }
    
    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        try type.asAnyDecodable() as! T
    }
}

// MARK: - _UnkeyedDecodingContainer
struct _UnkeyedDecodingContainer: UnkeyedDecodingContainer {
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
        isAtEnd = true
        return try type.asAnyDecodable() as! T
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
struct _KeyedDecodingContainer<K>: KeyedDecodingContainerProtocol where K: CodingKey {
    typealias Key = K

    var codingPath: [CodingKey]
    var allKeys: [K] = []
    
    init(codingPath: [CodingKey]) {
        self.codingPath = codingPath
    }
    
    func contains(_ key: K) -> Bool { true }
    
    func decodeNil(forKey key: K) throws -> Bool { false }
 
    func decode<T>(_ type: T.Type, forKey key: K) throws -> T where T : Decodable {
        if let asable = try? type.asAnyDecodable() {
            return asable.anyValue() as! T
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
extension Decodable {
    static func asAnyDecodable() throws -> AnyDecodable.Type {
        guard let asable = Self.self as? AnyDecodable.Type else {
            throw _DecoderError(message: "not support type \(Self.self)")
        }
        return asable
    }
}


// MARK: - _DecoderError
struct _DecoderError: Error {
    let message: String
    let file: String
    let line: Int
    
    init(message: String, file: String = #file, line: Int = #line) {
        self.message = message
        self.file = file
        self.line = line
    }
}


