//
//  UIView+Borders.swift
//  TableViewCellCustomBorderTest
//
//  Created by Rehnuma Reza Deepty on 1/8/23.
//

import Foundation
import UIKit

extension UIView {
    func addTopLeftRightBorder(with radius: CGFloat) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: radius))
        path.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: -.pi, endAngle: -.pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: bounds.maxX, y: 0))
        path.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: -.pi, endAngle: -.pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        
        shape.fillColor = UIColor.red.cgColor
        shape.lineWidth = 1
        layer.mask = shape
        layer.addSublayer(shape)
        
        path.close()
    }
}
