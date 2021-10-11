//
//  Array+Query.swift
//  WUtilsFramework
//
//  Created by wjling on 2021/10/11.
//

import Foundation

public extension ArrayInstanceExtensionHelper {
    /// Get array element at index
    /// - Parameter index: Array index
    /// - Returns: Array element, if exists.
    func object(at index: Int) -> ArrayElement? {
        if index < 0 || index >= base.count {
            return nil
        }
        return base[index]
    }
}
