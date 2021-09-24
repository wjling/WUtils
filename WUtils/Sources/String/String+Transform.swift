//
//  String+Transform.swift
//  String+Transform
//
//  Created by wjling on 2021/9/24.
//

import Foundation

extension String: InstanceExtensionProtocol {}

public extension InstanceExtensionHelper where Base == String {
    /// 16进制String转UInt64
    var hexValue: UInt64? {
        var value: UInt64 = 0
        if Scanner.init(string: base).scanHexInt64(&value) {
            return value
        }
        return nil
    }
}
