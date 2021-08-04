//
//  ExtensionProtocol.swift
//  WUtils
//
//  Created by wjling on 2021/8/3.
//

import Foundation
import UIKit

public protocol InstanceExtensionProtocol {
    associatedtype someType
    var w: someType { get }
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

public protocol StaticExtensionProtocol {
    associatedtype someType
    static var w: someType { get }
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

extension UIView: StaticExtensionProtocol {}

public extension StaticExtensionHelper where Base: UIView {

    func create() {

    }
    
    func testText() -> String {
        return "WUtils Test String~"
    }
}
