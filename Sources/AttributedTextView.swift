//
//  SwiftyLabel.swift
//
//  Created by Edwin Vermeer on 25/11/2016.
//  Copyright © 2016 Edwin Vermeer. All rights reserved.
//

import UIKit

/**
 Set this class as the 'Custom Class' when you add a UITextView in the interfacebuilder. 
 Use the attributer property for setting the attributed text.
 */
open class AttributedTextView: UITextView, UITextViewDelegate {

    
    private var _attributer: Attributer?
    /**
     The attributer object that will set the attributedText
     */
    open var attributer: Attributer {
        get {
            if _attributer == nil {
                _attributer = Attributer("")
            }
            return _attributer!
        }
        set { 
            _attributer = newValue
            self.attributedText = _attributer?.string

            super.delegate = self
            self.isUserInteractionEnabled = true
            self.isSelectable = true
            self.isEditable = false
            if let color = _attributer?.linkColor {
                self.linkTextAttributes = [NSForegroundColorAttributeName: color]
            }
        }
    }

    /**
     If you manually set the delegate on the AttributedTextView, then it will set this property instead of the actual delegate. The actual delegate will be set to this class itself for handling the interactions on the links. events will be forwarded to the _delegate.
     */
    public var _delegate: UITextViewDelegate?
    /**
     Delegate that can be set for forwarding events from the UITextView
     */
    override open var delegate: UITextViewDelegate? {
        get {
            return super.delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    
    // MARK: - UITextViewDelegate functions - forwarding all to _delegate

    /**
     UITextViewDelegate function for forwarding the textViewShoudlBeginEditing
     
     -property textView: The UITextView where the delegate is called on
     */
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return _delegate?.textViewShouldBeginEditing?(textView) ?? false
    }
    
    /**
     UITextViewDelegate function for forwarding the textViewShouldEndEditing
     
     -property textView: The UITextView where the delegate is called on
     */
    public func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return _delegate?.textViewShouldEndEditing?(textView) ?? false
    }
    
    /**
     UITextViewDelegate function for forwarding the textViewDidBeginEditing
     
     -property textView: The UITextView where the delegate is called on
     */
    public func textViewDidBeginEditing(_ textView: UITextView) {
        _delegate?.textViewDidBeginEditing?(textView)
    }
    
    /**
     UITextViewDelegate function for forwarding the textViewDidEndEditing
     
     -property textView: The UITextView where the delegate is called on
     */
    public func textViewDidEndEditing(_ textView: UITextView) {
        _delegate?.textViewDidEndEditing?(textView)
    }
    
    
    /**
     UITextViewDelegate function for forwarding the shouldChangeTextIn range
     
     -property textView: The UITextView where the delegate is called on
     -property shouldChangeTextIn: the range
     -property replacementText: the replacement text
     */
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return _delegate?.textView?(textView, shouldChangeTextIn: range, replacementText: text) ?? false
    }
    
    /**
     UITextViewDelegate function for forwarding the textViewDidChange
     
     -property textView: The UITextView where the delegate is called on
     */
    public func textViewDidChange(_ textView: UITextView) {
        _delegate?.textViewDidChange?(textView)
    }
    
    /**
     UITextViewDelegate function for forwarding the textViewDidChangeSelection
     
     -property textView: The UITextView where the delegate is called on
     */
    public func textViewDidChangeSelection(_ textView: UITextView) {
        _delegate?.textViewDidChangeSelection?(textView)
    }
    
    /**
     UITextViewDelegate function for forwarding the shouldInteractWith URL
     
     -property textView: The UITextView where the delegate is called on
     -property shouldInteractWith: The URL to interact with
     -property characterRagne: the NSRange for the selection
     -property interaction: The UITextItemInteraction
     */
    @available(iOS 10.0, *)
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        _attributer?.interactWithURL(URL: URL)
        return _delegate?.textView?(textView, shouldInteractWith: URL, in: characterRange, interaction: interaction) ?? false
    }
    
    /**
     UITextViewDelegate function for forwarding the shouldInteractWith textAttachment
     
     -property textView: The UITextView where the delegate is called on
     -property shouldInteractWith: the NSTextAttachement
     -property characterRange: the NSRange for the selection
     -property interaction: The UITextItemInteraction
     */
    @available(iOS 10.0, *)
    public func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return _delegate?.textView?(textView, shouldInteractWith: textAttachment, in: characterRange, interaction: interaction) ?? false
    }
    
    /**
     UITextViewDelegate function for forwarding the shouldInteractWith URL
     
     -property textView: The UITextView where the delegate is called on
     -property shouldInteractWith: the NSTextAttachement
     -property characterRange: the NSRange for the selection
     */
    @available(iOS, introduced: 7.0, deprecated: 10.0, message: "Use textView:shouldInteractWithURL:inRange:forInteractionType: instead")
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        _attributer?.interactWithURL(URL: URL)
        return _delegate?.textView!(textView, shouldInteractWith: URL, in: characterRange) ?? false
    }
    
    /**
     UITextViewDelegate function for forwarding the shouldInteractWith textAttachment
     
     -property textView: The UITextView where the delegate is called on
     -property shouldInteractWith: the NSTextAttachement
     -property characterRange: the NSRange for the selection
     */
    @available(iOS, introduced: 7.0, deprecated: 10.0, message: "Use textView:shouldInteractWithURL:inRange:forInteractionType: instead")
    public func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange) -> Bool {
        return _delegate?.textView?(textView, shouldInteractWith: textAttachment, in: characterRange) ?? false
    }
}


