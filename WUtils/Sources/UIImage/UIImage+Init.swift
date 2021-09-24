//
//  UIImage+Init.swift
//  WUtils
//
//  Created by wjling on 2021/9/15.
//

import Foundation
import UIKit

public extension UIImage {
    convenience init(color: UIColor, size: CGSize, roundingCorners: UIRectCorner = .allCorners, cornerRadius: Double) {
        let renderer = UIGraphicsImageRenderer.init(size: size)
        let img = renderer.image { context in
            let rectPath = UIBezierPath.init(roundedRect: CGRect.init(origin: .zero, size: size), byRoundingCorners: roundingCorners, cornerRadii: CGSize.init(width: cornerRadius, height: cornerRadius))
            context.cgContext.addPath(rectPath.cgPath)
            color.setFill()
            context.cgContext.fillPath()
        }
        if let cgImage = img.cgImage {
            self.init(cgImage: cgImage)
        } else {
            self.init()
        }
    }
}

