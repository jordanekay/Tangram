//
//  Customizable.swift
//  View
//
//  Created by Jordan Kay on 5/19/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

extension CustomizableView {
    // MARK: UIView
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateCustomizableContent()
    }
}

// MARK: -
extension UIImageView {
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateCustomizableContent()
    }
}

// MARK: -
extension MKMapView {
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateCustomizableContent()
    }
}

// MARK: -
extension UIControl {
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateCustomizableContent()
    }
}

// MARK: -
private extension UIView {
    func updateCustomizableContent() {
        (self as? Rounded)?.updateRoundedLayer()
        (self as? Bordered)?.updateBorderLayer()
        (self as? Shadowed)?.updateShadowLayer()
    }
}
