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
        return replacementView(forInterfaceBuilder: false) ?? super.awakeAfter(using: coder)
    }
    
    override open func prepareForInterfaceBuilder() {
        guard let contentView = replacementView(forInterfaceBuilder: true) else { return }
        
        contentView.frame = bounds
        addSubview(contentView)
    }
}

// MARK: -
private extension UIView {
    func replacementView(forInterfaceBuilder: Bool) -> UIView? {
        // This view only needs to be replaced if it is nib-loadable and has no content yet
        guard let nibLoadable = self as? NibLoadable, subviews.count == 0 else { return nil }

        let replacementView = try! nibLoadable.replacementViewLoadedFromNib(byInterfaceBuilder: forInterfaceBuilder)
        replacementView.restorationIdentifier = restorationIdentifier

        if forInterfaceBuilder {
            replacementView.finishLoading(toReplace: self)
        } else {
            replacementView.setupOutletContent()
        }
        
        return replacementView
    }
}
