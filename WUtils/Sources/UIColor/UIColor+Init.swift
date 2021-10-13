//
//  UIColor+Init.swift
//  UIColor+Init
//
//  Created by wjling on 2021/9/23.
//

import Foundation
import UIKit

public extension UIColor {
    convenience init(_ hex: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(hex >> 16) / 255, green: CGFloat((hex >> 8) & 0xFF) / 255, blue: CGFloat(hex & 0xFF) / 255, alpha: alpha)
    }
    
    convenience init?(_ hex: String, alpha: CGFloat = 1.0) {
        var colorHex = hex
        if colorHex.hasPrefix("#") {
            colorHex = String(hex[hex.index(hex.startIndex, offsetBy: 1)...])
            // Maybe is a CSS format color for short.
            if colorHex.count == 3 {
                colorHex = colorHex.reduce("", {"\($0)\($1)\($1)"})
            }
        }
        if let hex = colorHex.w.toHex() {
            self.init(Int(hex), alpha: alpha)
        } else {
            return nil
        }
    }
}
