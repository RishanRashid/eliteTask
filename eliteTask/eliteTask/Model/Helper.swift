//
//  Helper.swift
//  eliteTask
//
//  Created by Allnet Systems on 7/15/24.
//

import Foundation
import UIKit

extension UIView {
    
    func applyShadow() {
  layer.shadowColor = UIColor.systemGray4.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
      layer.shadowOpacity = 1
        layer.masksToBounds = false
        layer.shadowRadius = 4.0

        }
    
    func applyCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func applyBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}


extension UIImageView {
    func roundTopCorners(radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
        clipsToBounds = true
    }
}
