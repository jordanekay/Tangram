//
//  Shadow.swift
//  View
//
//  Created by Jordan Kay on 5/20/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

protocol Shadowed: UIView {
    var shadowOpacity: Float { get }
    var shadowRadius: CGFloat { get }
    var shadowOffset: CGSize { get }
    var shadowSpread: CGFloat { get }
}

// MARK: -
extension Shadowed {
    func updateShadowLayer() {
        let inset = -shadowSpread
        let rect = bounds.insetBy(dx: inset, dy: inset)
        
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius / 2
        layer.shadowOffset = shadowOffset
        layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: layer.cornerRadius).cgPath
        
        if shadowOpacity > 0 {
            layer.masksToBounds = false
        }
    }
}
