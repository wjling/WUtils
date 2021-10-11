//
//  Array+Conversion.swift
//  WUtilsFramework
//
//  Created by wjling on 2021/10/9.
//

import Foundation

public extension ArrayInstanceExtensionHelper {
    /// Convert Array to Data by JSONSerialization
    func toJSONData() -> Data? {
        if !JSONSerialization.isValidJSONObject(base) {
            return nil
        }
        return try? JSONSerialization.data(withJSONObject: base, options: .fragmentsAllowed)
    }
    
    /// Convert Array to String with JSON data
    func toString() -> String? {
        guard let data = toJSONData() else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

public extension ArrayInstanceExtensionHelper where ArrayElement: Encodable {
    /// Convert Array to Data by JSONEncoder
    func toEncodedData() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(base)
    }
    
    /// Convert Array to String with encoded data
    func toString() -> String? {
        guard let data = toEncodedData() else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
