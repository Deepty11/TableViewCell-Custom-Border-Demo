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
        updateBorders()
    }
    
    override var bounds: CGRect {
        didSet {
            updateBorders()
        }
    }
    
    func updateBorders() {
        if leftBorder == nil { leftBorder = addBorder() }
        
        if rightBorder == nil { rightBorder = addBorder()}
        
        leftBorder?.frame = CGRect(
            x: container.bounds.minX,
            y: 0,
            width: borderWidth,
            height: bounds.maxY
        )
        
        rightBorder?.frame = CGRect(
            x: container.bounds.maxX - borderWidth,
            y: 0,
            width: borderWidth,
            height: bounds.maxY
        )
        
        // For DEBUG
        print("bounds.minX \(bounds.minX)")
        print("container.bounds.maxX \(container.bounds.minX)")

        print("bounds.maxX \(bounds.maxX)")
        print("container.bounds.maxX \(container.bounds.maxX)")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateBorders()
    }

    func addBorder() -> CALayer {
        let border = CALayer()
        border.backgroundColor = UIColor.red.cgColor
        container.layer.addSublayer(border)
        
        return border
    }
}


