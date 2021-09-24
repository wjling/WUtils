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
    
    var title: String {
        switch self {
        case .test:
            return "测试页面"
        }
    }
    
    var controller: UIViewController {
        var vc: UIViewController
        switch self {
        case .test:
            vc = ImageInitController()
        }
        vc.title = title
        return vc
    }
}
