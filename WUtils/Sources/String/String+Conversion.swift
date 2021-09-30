//
//  String+Conversion.swift
//  String+Conversion
//
//  Created by wjling on 2021/9/24.
//

import Foundation

extension String: InstanceExtensionProtocol {}

public extension InstanceExtensionHelper where Base == String {
    /// Convert hexadecimal string to UInt64
    var hexValue: UInt64? {
        var value: UInt64 = 0
        if Scanner.init(string: base).scanHexInt64(&value) {
            return value
        }
        return nil
    }
}
