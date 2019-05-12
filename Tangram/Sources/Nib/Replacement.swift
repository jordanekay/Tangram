//
//  Replacement.swift
//  Tangram
//
//  Created by Jordan Kay on 4/3/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

extension UIView {
    // MARK: NSObject
    override open func awakeAfter(using coder: NSCoder) -> Any? {
        guard !isInterfaceBuilder else { return super.awakeAfter(using: coder) }
        return replacementView ?? super.awakeAfter(using: coder)
    }
    
    override open func prepareForInterfaceBuilder() {
        guard let contentView = replacementView else { return }
        
        contentView.frame = bounds
        addSubview(contentView)
        
        contentView.subviews.forEach { $0.prepareForInterfaceBuilder() }
    }
}

// MARK: -
private extension UIView {
    var replacementView: UIView? {
        // This view only needs to be replaced if it is nib-loadable and has no content yet
        guard let nibLoadable = self as? NibLoadable, subviews.count == 0 else { return nil }

        let replacementView = try! nibLoadable.replacementViewLoadedFromNib(byInterfaceBuilder: isInterfaceBuilder)
        replacementView.setProperties(from: self)
        replacementView.addConstraints(from: self)

        if isInterfaceBuilder {
            replacementView.finishLoading(toReplace: self)
        }
        
        return replacementView
    }
    
    func setProperties(from view: UIView) {
        frame = view.frame
        backgroundColor = view.backgroundColor
        autoresizingMask = view.autoresizingMask
        restorationIdentifier = view.restorationIdentifier
    }
    
    func addConstraints(from view: UIView) {
        for constraint in view.constraints where constraint.firstItem === view {
            let replacementConstraint = NSLayoutConstraint(item: self, attribute: constraint.firstAttribute, relatedBy: constraint.relation, toItem: constraint.secondItem, attribute: constraint.secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant)
            addConstraint(replacementConstraint)
        }
    }
}

// MARK: -
private let isInterfaceBuilder = Bundle.main.bundleIdentifier?.contains("InterfaceBuilder") ?? true
