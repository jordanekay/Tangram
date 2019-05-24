//
//  CustomizableImageView.swift
//  View
//
//  Created by Jordan Kay on 5/21/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

@IBDesignable open class CustomizableImageView: UIImageView {
    lazy var borderLayer: CAShapeLayer = {
        let borderLayer = CAShapeLayer()
        self.layer.addSublayer(borderLayer)
        return borderLayer
    }()
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable public var hasCircularCorners: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize = .zero {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable public var shadowSpread: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
}

// MARK: -
extension CustomizableImageView: Rounded {}

// MARK: -
extension CustomizableImageView: Bordered {}

// MARK: -
extension CustomizableImageView: Shadowed {}
