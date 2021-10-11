//
//  Dictionary+Conversion.swift
//  WUtilsFramework
//
//  Created by wjling on 2021/10/9.
//

import Foundation

public extension DictionaryInstanceExtensionHelper {
    
    /// Convert Dictionary to Data
    func toData() -> Data? {
        if JSONSerialization.isValidJSONObject(base) {
            if let jsonData = try? JSONSerialization.data(withJSONObject: base, options: .fragmentsAllowed) {
                return jsonData
            }
        }
        return nil
    }
    
    /// Convert Dictionary to JSON string
    func toJSONString() -> String? {
        if let jsonData = toData() {
            return String.init(data: jsonData, encoding: .utf8)
        }
        return nil
    }
}
