//
//  DemoManager.swift
//  DemoManager
//
//  Created by wjling on 2021/9/23.
//

import Foundation
import UIKit

enum Demo: CaseIterable {
    case imageAndColor
    case swizzleMethod
    case arrayAndDictExtension
    
    var title: String {
        switch self {
        case .imageAndColor:
            return "绘图测试"
        case .swizzleMethod:
            return "方法交换"
        case .arrayAndDictExtension:
            return "数组和字典扩展测试"
        }
    }
    
    var controller: UIViewController {
        var vc: UIViewController
        switch self {
        case .imageAndColor:
            vc = ImageInitController()
        case .swizzleMethod:
            vc = SwizzleViewController()
        case .arrayAndDictExtension:
            vc = ExtensionTestController()
        }
        vc.title = title
        return vc
    }
}
