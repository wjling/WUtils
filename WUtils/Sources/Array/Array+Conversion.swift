//
//  Array+Conversion.swift
//  WUtilsFramework
//
//  Created by wjling on 2021/10/9.
//

import Foundation

public extension ArrayInstanceExtensionHelper {
    func toString() -> String? {
        if let data = toData() {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    func toData() -> Data? {
        if !JSONSerialization.isValidJSONObject(base) {
            return nil
        }
        return try? JSONSerialization.data(withJSONObject: base, options: .fragmentsAllowed)
    }
}
