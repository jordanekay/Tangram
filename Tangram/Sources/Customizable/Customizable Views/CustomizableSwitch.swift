//
//  CustomizableSwitch.swift
//  View
//
//  Created by Jordan Kay on 5/21/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

@IBDesignable open class CustomizableSwitch: UISwitch {
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
}

// MARK: -
extension CustomizableSwitch: Rounded {}
