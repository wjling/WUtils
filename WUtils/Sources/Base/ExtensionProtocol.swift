//
//  ExtensionProtocol.swift
//  WUtils
//
//  Created by wjling on 2021/8/3.
//

import Foundation
import UIKit

// MARK: - General Instance Protocol & Helper
public protocol InstanceExtensionProtocol {
    associatedtype InstanceType
    var w: InstanceType { get }
}

public extension InstanceExtensionProtocol {
    var w: InstanceExtensionHelper<Self> { InstanceExtensionHelper(self) }
}

public class InstanceExtensionHelper<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

// MARK: - General Static Protocol & Helper
public protocol StaticExtensionProtocol {
    associatedtype StaticType
    static var w: StaticType { get }
}

public extension StaticExtensionProtocol {
    static var w: StaticExtensionHelper<Self> { StaticExtensionHelper(Self.self) }
}

public class StaticExtensionHelper<Base> {
    var base: Base.Type
    init(_ base: Base.Type) {
        self.base = base
    }
}

// MARK: - Array Extension
public class ArrayInstanceExtensionHelper<ArrayElement> {
    let base: [ArrayElement]
    init(_ base: [ArrayElement]) {
        self.base = base
    }
}

extension Array: InstanceExtensionProtocol {
    public var w: ArrayInstanceExtensionHelper<Self.Element> { ArrayInstanceExtensionHelper(self) }
}

// MARK: - Dictionary Extension
public class DictionaryInstanceExtensionHelper<DictKey, DictValue> where DictKey: Hashable {
    let base: [DictKey: DictValue]
    init(_ base: [DictKey: DictValue]) {
        self.base = base
    }
}

extension Dictionary: InstanceExtensionProtocol {
    public var w: DictionaryInstanceExtensionHelper<Self.Key, Self.Value> { DictionaryInstanceExtensionHelper(self) }
}

// MARK: - Other Extension
extension NSObject: StaticExtensionProtocol {}
extension NSObject: InstanceExtensionProtocol {}
