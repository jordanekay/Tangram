//
//  Border.swift
//  Tangram
//
//  Created by Jordan Kay on 5/7/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

@IBDesignable public final class BorderedView: UIView {
    private lazy var borderLayer: CAShapeLayer = {
        let borderLayer = CAShapeLayer()
        self.layer.addSublayer(borderLayer)
        return borderLayer
    }()
}

// MARK: -
public extension BorderedView {
    @IBInspectable var borderColor: UIColor? {
        get {
            return borderLayer.borderColor.map(UIColor.init)
        }
        set {
            borderLayer.borderColor = newValue?.cgColor
        }
    }
    
    // MARK: UIView
    override var cornerRadius: CGFloat {
        didSet {
            borderLayer.cornerRadius = cornerRadius + borderWidth / 2
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutBorderLayer()
    }
}

// MARK: -
private extension BorderedView {
    @IBInspectable var borderWidth: CGFloat {
        get {
            return borderLayer.borderWidth
        }
        set {
            borderLayer.borderWidth = newValue
        }
    }
    
    func layoutBorderLayer() {
        let inset = -borderWidth / 2
        let insets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        borderLayer.frame = bounds.inset(by: insets)
    }
}
