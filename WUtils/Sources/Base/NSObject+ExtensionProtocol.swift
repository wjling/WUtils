//
//  NSObject+ExtensionProtocol.swift
//  WUtils
//
//  Created by wjling on 2021/9/15.
//

import Foundation

public extension InstanceExtensionHelper where Base: NSObject {
    func getIvarValue<T>(ivarName: String, ivarType: T.Type) -> T? {
        var objectValue: T?
        var count: UInt32 = 0
        // Get member variables of the object
        guard let ivars = class_copyIvarList(Base.self, &count) else { return nil }
        for index in 0..<count {
            let ivar = ivars[Int(index)]
            if let cchar_Name = ivar_getName(ivar) {
                let name = String(cString: cchar_Name)
                print("ivar name: \(name)")
                // Get offset of variable's pointer
                if name == ivarName {
                    let ivarOffset = ivar_getOffset(ivar)
                    // Get pointer of the object
                    let objectPointer = Unmanaged.passUnretained(base).toOpaque()
                    objectValue = objectPointer.advanced(by: ivarOffset).bindMemory(to: ivarType, capacity: MemoryLayout<T>.size).pointee
                    break
                }
            }
        }
        free(ivars)
        return objectValue
    }
    
    func getPropertyNames() -> [String] {
        var names: [String] = []
        var count: UInt32 = 0
        // Get properties of the object
        if let properties = class_copyPropertyList(Base.self, &count) {
            for index in 0..<count {
                let property = properties[Int(index)]
                let cchar_Name = property_getName(property)
                let name = String(cString: cchar_Name)
                names.append(name)
                print("property name: \(name)")
            }
        }
        return names
    }
}
