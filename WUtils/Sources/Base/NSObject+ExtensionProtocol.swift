//
//  NSObject+ExtensionProtocol.swift
//  WUtils
//
//  Created by wjling on 2021/9/15.
//

import Foundation

extension NSObject: InstanceExtensionProtocol {}

public extension InstanceExtensionHelper where Base: NSObject {
    func getIvarValue<T>(ivarName: String, ivarType: T.Type) -> T? {
        var objectValue: T?
        // 获取object的指针
        let objectPointer = Unmanaged.passUnretained(base).toOpaque()
        var count: UInt32 = 0
        // 获取object的成员变量列表
        guard let ivars = class_copyIvarList(Base.self, &count) else { return nil }
        for index in 0..<count {
            let ivar = ivars[Int(index)]
            if let cchar_Name = ivar_getName(ivar) {
                let pName = String(cString: cchar_Name)
                // 获取变量的指针偏移量
                let ivarOffset = ivar_getOffset(ivar)
                if pName == ivarName {
                    objectValue = objectPointer.advanced(by: ivarOffset).bindMemory(to: ivarType, capacity: MemoryLayout<T>.size).pointee
                    break
                }
            }
        }
        free(ivars)
        return objectValue
    }
}
