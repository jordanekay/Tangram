//
//  Shadow.swift
//  View
//
//  Created by Jordan Kay on 5/7/19.
//  Copyright © 2019 CultivR. All rights reserved.
//


// MARK: -
@IBDesignable public final class ShadowView: UIView {
    @IBInspectable private var shadowSpread: CGFloat = 0
}

// MARK: -
public extension ShadowView {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadowPath()
    }
}

// MARK: -
private extension ShadowView {
    func updateShadowPath() {
        let inset = -shadowSpread
        let rect = bounds.insetBy(dx: inset, dy: inset)
        layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
    }
}

private extension UIView {
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue / 2
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
}
