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
            layer.masksToBounds = false
            layer.shadowOpacity = 0.5
            layer.shadowOffset = CGSize(width: 0, height: 4)
            layer.shadowRadius = 6
            
            if superview != nil {
                layer.shadowColor = UIColor.gray.cgColor
            } else {
                layer.shadowColor = UIColor.black.cgColor
            }
            
            if backgroundColor == nil {
                backgroundColor = .white 
            }
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
