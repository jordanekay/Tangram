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
    }
}

// MARK: -
private extension UIView {
    var replacementView: UIView? {
        // This view only needs to be replaced if it is nib-loadable and has no content yet
        guard let nibLoadable = self as? NibLoadable, subviews.count == 0 else { return nil }

        let replacementView = try! nibLoadable.replacementViewLoadedFromNib(byInterfaceBuilder: isInterfaceBuilder)
        replacementView.frame = frame
        replacementView.backgroundColor = backgroundColor
        replacementView.autoresizingMask = autoresizingMask
        replacementView.restorationIdentifier = restorationIdentifier

        if isInterfaceBuilder {
            replacementView.finishLoading(toReplace: self)
        } else {
            replacementView.setupOutletContent()
        }
        
        return replacementView
    }
}

// MARK: -
private let isInterfaceBuilder = Bundle.main.bundleIdentifier?.contains("InterfaceBuilder") ?? true
