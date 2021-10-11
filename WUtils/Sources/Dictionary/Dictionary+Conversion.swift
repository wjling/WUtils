//
//  Dictionary+Conversion.swift
//  WUtilsFramework
//
//  Created by wjling on 2021/10/9.
//

import Foundation

public extension DictionaryInstanceExtensionHelper {
    /// Convert Dictionary to Data by JSONSerialization
    func toJSONData() -> Data? {
        if JSONSerialization.isValidJSONObject(base) {
            if let jsonData = try? JSONSerialization.data(withJSONObject: base, options: .fragmentsAllowed) {
                return jsonData
            }
        }
        return nil
    }
    
    /// Convert Dictionary to String with JSON data
    func toString() -> String? {
        guard let data = toJSONData() else { return nil }
        return String.init(data: data, encoding: .utf8)
    }
}

public extension DictionaryInstanceExtensionHelper where DictKey: Encodable, DictValue: Encodable {
    /// Convert Dictionary to Data by JSONEncoder
    func toEncodedData() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(base)
    }
    
    /// Convert Dictionary to String with encoded data.
    func toString() -> String? {
        guard let data = toEncodedData() else { return nil }
        return String.init(data: data, encoding: .utf8)
    }
}
