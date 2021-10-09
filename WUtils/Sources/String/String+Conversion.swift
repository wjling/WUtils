//
//  String+Conversion.swift
//  String+Conversion
//
//  Created by wjling on 2021/9/24.
//

import Foundation

extension String: InstanceExtensionProtocol {}

public extension InstanceExtensionHelper where Base == String {
    /// Convert hexadecimal string to UInt64.
    func toHex() -> UInt64? {
        var value: UInt64 = 0
        if Scanner.init(string: base).scanHexInt64(&value) {
            return value
        }
        return nil
    }
    
    /// Convert string to utf8 encoded data.
    func toUTF8Data() -> Data {
        Data.init(base.utf8)
    }
    
    /// Convert string to data.
    /// - Parameter encode: String encoding option
    /// - Returns: Data, maybe nil
    func toData(_ encode: String.Encoding = .utf8) -> Data? {
        base.data(using: encode)
    }
    
    /// Convert string to dictionary
    func toDict() -> [String: Any]? {
        try? JSONSerialization.jsonObject(with: toUTF8Data(), options: .fragmentsAllowed) as? [String: Any]
    }
}
