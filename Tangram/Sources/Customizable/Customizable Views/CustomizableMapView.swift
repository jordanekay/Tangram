//
//  CustomizableMapView.swift
//  View
//
//  Created by Jordan Kay on 5/21/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

@IBDesignable open class CustomizableMapView: MKMapView {
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
}

// MARK: -
extension CustomizableMapView: Rounded {
    var hasCircularCorners: Bool {
        return false
    }
}

// MARK: -
extension CustomizableMapView: Bordered {}
