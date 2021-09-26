//
//  CrashProtect+KVC.swift
//  CrashProtect+KVC
//
//  Created by wjling on 2021/9/26.
//

import Foundation

//public extension NSObject {
//    @objc func value(forUndefinedKey key: String) -> Any? {
//        print("[WUtils]CrashGuard - exception in value(forUndefinedKey: \(key)), reason: key is undefined")
//        return nil
//    }
//
//    @objc func setNilValueForKey(_ key: String) {
//        print("[WUtils]CrashGuard - exception in setNilValueForKey(: \(key)), reason: value is nil")
//    }
//
//    @objc override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        print("[WUtils]CrashGuard - exception in setValue(: \(value), forUndefinedKey: \(key)), reason: key is undefined")
//    }
//}

public extension UIResponder {
    override func value(forUndefinedKey key: String) -> Any? {
        print("[WUtils]CrashGuard - exception in value(forUndefinedKey: \(key)), reason: key is undefined")
        return nil
    }

    override func setNilValueForKey(_ key: String) {
        print("[WUtils]CrashGuard - exception in setNilValueForKey(: \(key)), reason: value is nil")
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("[WUtils]CrashGuard - exception in setValue(: \(value), forUndefinedKey: \(key)), reason: key is undefined")
    }
}
