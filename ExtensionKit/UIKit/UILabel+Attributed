//
//  UILabel+Attributed.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 04/05/2021.
//  Copyright © Victor Marcias. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    enum AttributeModifier {
        case font(_ font: UIFont)
        case color(_ color: UIColor)
        case backgroundColor(_ color: UIColor)
    }
    
    @discardableResult
    func attributed(range: String, modifier: AttributeModifier) -> Self {
        // check text
        guard let text = self.text ?? self.attributedText?.string else { return self }
        let attributedString = self.attributedText != nil ?
            NSMutableAttributedString(attributedString: self.attributedText!) :
            NSMutableAttributedString(string: text)
        let attr = attribute(for: modifier)
        
        // add attribute to subtext in range
        guard let range = text.range(of: range)?.nsRange(in: text) else { return self }
        attributedString.addAttribute(attr.0, value: attr.1, range: range)
        self.attributedText = attributedString
        
        // return UILabel again to chain attributes
        return self
    }
    
    @discardableResult
    func attributedLink(range: String, target: Any? = nil, action: Selector? = nil) -> Self {
        guard let target = target, let action = action else { return self }
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        return self
    }
    
    private func attribute(for modifier: AttributeModifier) -> (NSAttributedString.Key, Any) {
        switch modifier {
        case .font(let font): return (.font, font)
        case .color(let color): return (.foregroundColor, color)
        case .backgroundColor(let color): return (.backgroundColor, color)
        }
    }
}

/// https://stackoverflow.com/questions/43233070/how-to-convert-range-in-nsrange
private extension RangeExpression where Bound == String.Index {
    func nsRange<S: StringProtocol>(in string: S) -> NSRange { .init(self, in: string) }
}
