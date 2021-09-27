//
//  NSObject+Swizzle.swift
//  NSObject+Swizzle
//
//  Created by wjling on 2021/9/26.
//

import Foundation

public extension StaticExtensionHelper where Base: NSObject {
    
    func swizzleInstanceMethod(originalSelector: Selector, swizzledSelector: Selector) {
        guard let originalMethod = class_getInstanceMethod(Base.self, originalSelector),
              let swizzledMethod = class_getInstanceMethod(Base.self, swizzledSelector) else { return }
        // If the method we swizzle is defined in a superclass, we have to use class_addMethod to add an implementation of it.
        // In this case class_addMethod will return true.
        let addMethodSuccess = class_addMethod(Base.self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        if addMethodSuccess {
            // If successfully added, use class_replaceMethod to replace the implementation of swizzledMethod with the one of superclass.
            class_replaceMethod(Base.self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            // If class_addMethod failed, which means the class already define the method, we just exchange the implementations.
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    func swizzleClassMethod(originalSelector: Selector, swizzledSelector: Selector) {
        /// Get the meta class. object_getClass returns which stored in isa.
        let classType = object_getClass(Base.self)
        guard let originalMethod = class_getClassMethod(classType, originalSelector),
              let swizzledMethod = class_getClassMethod(classType, swizzledSelector) else { return }
        // If the method we swizzle is defined in a superclass, we have to use class_addMethod to add an implementation of it.
        // In this case class_addMethod will return true.
        let addMethodSuccess = class_addMethod(classType, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        if addMethodSuccess {
            // If successfully added, use class_replaceMethod to replace the implementation of swizzledMethod with the one of superclass.
            class_replaceMethod(classType, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            // If class_addMethod failed, which means the class already define the method, we just exchange the implementations.
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
