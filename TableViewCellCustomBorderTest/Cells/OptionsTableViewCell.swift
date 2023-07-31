//
//  OptionsTableViewCell.swift
//  TableViewCellCustomBorderTest
//
//  Created by Rehnuma Reza on 31/7/23.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
    var leftBorder: CALayer?
    var rightBorder: CALayer?
    
    var edges: UIRectEdge?
    let borderWidth: CGFloat = 3
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        edges = [.left, .right]
//        container.addBorders(edges: edges ?? .all, color: .red, width: borderWidth)
        if leftBorder == nil {
            addLeftBorder()
        }
        
        if rightBorder == nil {
            addRightBorder()
        }
        
         //Update the frames based on the current bounds
        leftBorder?.frame = CGRect(x: bounds.minX,
                                    y: 0,
                                    width: borderWidth,
                                    height: bounds.maxY)
        print(bounds.maxX)
//        rightBorder?.frame = CGRect(x: bounds.maxX,
//                                    y: 0,
//                                    width: borderWidth,
//                                    height: bounds.maxY)
        
        rightBorder?.frame = CGRect(x: bounds.maxX - borderWidth,
                                       y: 0,
                                       width: borderWidth,
                                       height: bounds.maxY)

    }
    
    func addLeftBorder() {
        leftBorder = CALayer()
        
        leftBorder?.backgroundColor = UIColor.red.cgColor
        
        container.layer.addSublayer(leftBorder ?? CALayer())
    }
    
    func addRightBorder() {
        rightBorder = CALayer()
        
        rightBorder?.backgroundColor = UIColor.red.cgColor
        
        container.layer.addSublayer(rightBorder ?? CALayer())
    }

}

extension UIView {
    func addBorders(edges: UIRectEdge, color: UIColor, width: CGFloat) {
        let border = CALayer()
        
        if edges.contains(.left) {
            border.frame = CGRect(x: 0,
                                  y: 0,
                                  width: width,
                                  height: frame.height)
            border.backgroundColor = color.cgColor
            layer.addSublayer(border)
            print(border.frame)
        }
        
        if edges.contains(.right) {
            border.frame = CGRect(x: frame.width,
                                  y: 0,
                                  width: width,
                                  height: frame.height)
            border.backgroundColor = color.cgColor
            layer.addSublayer(border)
        }
        
        if edges.contains(.top) {
            border.frame = CGRect(x: 0,
                                  y: 0,
                                  width: frame.width,
                                  height: width)
            border.backgroundColor = color.cgColor
            layer.addSublayer(border)
        }
        
        if edges.contains(.bottom) {
            border.frame = CGRect(x: frame.height,
                                  y: 0,
                                  width: frame.width,
                                  height: width)
            border.backgroundColor = color.cgColor
            layer.addSublayer(border)
        }
        

        
//        switch edges {
//        case .left: border.frame = CGRect(x: 0,
//                                         y: 0,
//                                         width: width,
//                                         height: frame.height)
//        case .right: border.frame = CGRect(x: frame.width,
//                                           y: 0,
//                                           width: width,
//                                           height: frame.height)
//        case .top: border.frame = CGRect(x: 0,
//                                         y: 0,
//                                         width: frame.width,
//                                         height: width)
//        case .bottom: border.frame = CGRect(x: frame.height,
//                                            y: 0,
//                                            width: frame.width,
//                                            height: width)
//        default: break
//
//        }

        
        
    }
}
