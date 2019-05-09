//
//  Corner.swift
//  View
//
//  Created by Jordan Kay on 5/7/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
