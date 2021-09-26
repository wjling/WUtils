//
//  UIColor+Init.swift
//  UIColor+Init
//
//  Created by wjling on 2021/9/23.
//

import Foundation
import UIKit

public extension UIColor {
    convenience init(hex: Int32, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(hex >> 16) / 255, green: CGFloat((hex >> 8) & 0xFF) / 255, blue: CGFloat(hex & 0xFF) / 255, alpha: alpha)
    }
}
