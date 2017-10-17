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
    
    // Add these fields in interfacebuilder and make sure the interface is updated after changes

    // This field is used as the field seperator for the other fields
    @IBInspectable var seperator: String? {
        didSet { configureAttributedLabel() }
    }

    // Enter here the texts for all itmes seperated by the seperator field
    @IBInspectable var multiTexts: String? {
        didSet { configureAttributedLabel() }
    }

    // Enter here the words that will be highlighted seperated by the seperator field
    @IBInspectable var multiHighlights: String? {
        didSet { configureAttributedLabel() }
    }

    // Enter here all values for the icons. 0 = okImage, 1 = notOKImage, otherwise warningImage
    @IBInspectable var multiIconState: String? {
        didSet { configureAttributedLabel() }
    }

    // This image is used for icon state 1
    @IBInspectable var okImage: UIImage? {
        didSet { configureAttributedLabel() }
    }
    
    // This image is used for icon state 0
    @IBInspectable var notOkImage: UIImage? {
        didSet { configureAttributedLabel() }
    }
    
    // This image is used for icon states that are not 0 or 1
    @IBInspectable var warningImage: UIImage? {
        didSet { configureAttributedLabel() }
    }

    // Configure our custom styling.
    override open func configureAttributedLabel() {
        
        // First make sure all fields are ok and complete
        self.attributedText = Attributer("Incomplete settings.").attributedText
        self.numberOfLines = 0
        guard let seperator = self.seperator else { return }
        guard let texts: [String] = multiTexts?.components(separatedBy: seperator) else { return }
        guard let highlights: [String] = multiHighlights?.components(separatedBy: seperator) else { return }
        guard let states: [String] = multiIconState?.components(separatedBy: seperator) else { return }
        guard let okImage = self.okImage else { return }
        guard let notOkImage = self.notOkImage else { return }
        guard let warningImage = self.warningImage else { return }
        if texts.count != highlights.count || texts.count != states.count { return }
        
        // Start with an empty Attributer
        var attr = Attributer("")
        
        // The icon needs this bounds in order to position it correctly
        let rect = CGRect(x: 0, y: -4, width: 20, height: 20)

        // loop through the items and buildup the bulit list
        for (index, state) in states.enumerated() {
            
            // What image do you want for this item
            let image = (state == "1" ? okImage : (state == "0" ? notOkImage : warningImage))
            
            // Build up a line and append it
            attr = attr.append(
            
                // The image
                Attributer(image, bounds: rect)
                
                // The text in green
                .append("   " + texts[index]).green.append("\n")
                
                // select the highlight text and make it red
                .match(highlights[index]).red
                )
        }
        
        // apply the correct paragraph layout and set the attributedText
        self.attributedText = attr.all.paragraphHeadIndent(34) // Make sure a second line is alligned
            .paragraphLineSpacing(-2) // a little less than default spacing between lines
            .paragraphSpacing(15) // The space between items
            .paragraphApplyStyling.attributedText // apply the styling and put it in the attributedText

        // Just to be sure
        layoutIfNeeded()
    }
}

