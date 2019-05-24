//
//  Corner.swift
//  View
//
//  Created by Jordan Kay on 5/20/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

protocol Rounded: UIView {
    var cornerRadius: CGFloat { get }
    var hasCircularCorners: Bool { get }
}

// MARK: -
extension Rounded {
    func updateRoundedLayer() {
        let cornerRadius = hasCircularCorners ? bounds.height / 2 : self.cornerRadius
        layer.cornerRadius = cornerRadius
    }
}
