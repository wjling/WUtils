//
//  DemoManager.swift
//  DemoManager
//
//  Created by wjling on 2021/9/23.
//

import Foundation
import UIKit

enum Demo: CaseIterable {
    case test
    case swizzleMethod
    
    var title: String {
        switch self {
        case .test:
            return "绘图测试"
        case .swizzleMethod:
            return "方法交换"
        }
    }
    
    var controller: UIViewController {
        var vc: UIViewController
        switch self {
        case .test:
            vc = ImageInitController()
        case .swizzleMethod:
            vc = SwizzleViewController()
        }
        vc.title = title
        return vc
    }
}
