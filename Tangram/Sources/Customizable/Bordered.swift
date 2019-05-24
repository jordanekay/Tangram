//
//  Border.swift
//  View
//
//  Created by Jordan Kay on 5/20/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

protocol Bordered: UIView {
    var borderColor: UIColor? { get }
    var borderWidth: CGFloat { get }
    var borderLayer: CAShapeLayer { get }
}

// MARK: -
extension Bordered {
    func updateBorderLayer() {
        let inset = -borderWidth / 2
        let insets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        borderLayer.borderColor = borderColor?.cgColor
        borderLayer.borderWidth = borderWidth
        borderLayer.frame = bounds.inset(by: insets)
        borderLayer.cornerRadius = layer.cornerRadius + borderWidth / 2
    }
}
