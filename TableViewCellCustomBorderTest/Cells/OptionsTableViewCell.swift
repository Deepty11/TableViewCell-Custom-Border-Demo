//
//  OptionsTableViewCell.swift
//  TableViewCellCustomBorderTest
//
//  Created by Rehnuma Reza on 31/7/23.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var container: BorderedView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
}

class BorderedView: UIView {
    var leftBorder: CALayer?
    var rightBorder: CALayer?
    
    let borderWidth: CGFloat = 3
    
    override var bounds: CGRect {
        didSet {
            updateBorders()
        }
    }
    
    func addBorder() -> CALayer {
        let border = CALayer()
        border.backgroundColor = UIColor.red.cgColor
        layer.addSublayer(border)
        
        return border
    }
    
    func updateBorders() {
        if leftBorder == nil {
            leftBorder = addBorder()
        }
        
        if rightBorder == nil {
            rightBorder = addBorder()
        }
        
        leftBorder?.frame = CGRect(
            x: bounds.minX,
            y: 0,
            width: borderWidth,
            height: bounds.maxY
        )
        
        rightBorder?.frame = CGRect(
            x: bounds.maxX - borderWidth,
            y: 0,
            width: borderWidth,
            height: bounds.maxY
        )
    }
}

