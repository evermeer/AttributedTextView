//
//  AttributedLabelSubclassDemo.swift
//  AttributedTextView
//
//  Created by Edwin Vermeer on 03/03/2017.
//  Copyright © 2017 evermeer. All rights reserved.
//

import AttributedTextView
import UIKit

@IBDesignable open class AttributedLabelSubclassDemo: AttributedLabel {
    // Add this field in interfacebuilder and make sure the interface is updated after changes
    @IBInspectable var highlightText: String? {
        didSet { configureAttributedLabel() }
    }
    
    // Configure our custom styling.
    override open func configureAttributedLabel() {
        self.numberOfLines = 0
        if let highlightText = self.highlightText {
            self.attributedText = self.text?.green.match(highlightText).red.string
        } else {
            self.attributedText = self.text?.green.string
        }
        layoutIfNeeded()
    }
}
