//
//  Attributer.swift
//
//  Created by Edwin Vermeer on 25/11/2016.
//  Copyright © 2016 Edwin Vermeer. All rights reserved.
//

import UIKit

/**
 The core of working with attributed strings
 */
open class Attributer {
    

    /**
     You can get the final NSMutableAttributedString from here
     */
    
    open var attributedText: NSMutableAttributedString
    /**
     Used to set the link color on the UITextView
     */
    public var linkColor: UIColor?

    /**
     Save all the callbacks (from the .makeInteract)
     */
    fileprivate var urlCallbacks: [String : ((_ link: String) -> ())] = [:]
    
    /**
     Do we have interactions
     */
    public func hasCallbacks() -> Bool {
        return urlCallbacks.count > 0
    }
    
    /**
     The current active ranges that will be influenced by all functions.
     */
    fileprivate var ranges: [NSRange] = [] {
        didSet {
            paragraphStyle = NSMutableParagraphStyle()
        }
    }
    
    /**
     The current active paragraphStyle
     */
    fileprivate var paragraphStyle = NSMutableParagraphStyle()
    
    
    /**
     Contructor method for Attributer
     
     Instantiate a new Attributer based on an attributed string
     
     -parameter string: The NSMutableAttributedString that will be used as the initial value of Attributer.
     */
    public init(_ string: NSMutableAttributedString) {
        self.attributedText = string
        ranges.append(NSRange(location: 0, length: self.attributedText.length))
    }
    
    /**
     Contructor method for Attributer
     
     Instantiate a new Attributer based on an attributed string (converted to a mutable first)
     
     -parameter string: The NSAttributedString that will be used as the initial value of Attributer.
     */
    public convenience init(_ string: NSAttributedString) {
        self.init(NSMutableAttributedString(attributedString: string))
    }
    
    /**
     Contructor method for Attributer
     
     Instantiate a new Attributer based on a string
     
     -parameter string: The NSString that will be used as the initial value of Attributer.
     */
    public convenience init(_ string: NSString) {
        self.init(NSMutableAttributedString(string: string as String))
    }
    
    /**
     Contructor method for Attributer
     
     Instantiate a new Attributer based on a string
     
     -parameter string: The String that will be used as the initial value of Attributer.
     */
    public convenience init(_ string: String) {
        self.init(NSMutableAttributedString(string: string))
    }

    /**
     Contructor method for Attributer
     
     Instantiate a new Attributer based on a string
     
     -parameter string: The String that will be used as the initial value of Attributer.
     */
    public convenience init(_ image: UIImage, bounds: CGRect? = nil) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        if let bounds = bounds {
            imageAttachment.bounds = bounds
        }
        self.init(NSAttributedString(attachment: imageAttachment))
    }
    
    
    //MARK - Color functions
    
    
    /**
     Apply the color black to the active range(es)
     */
    open var black: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.black)
        }
    }

    /**
     Apply the color darkGray to the active range(es)
     */
    open var darkGray: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.darkGray)
        }
    }

    /**
     Apply the color lightGray to the active range(es)
     */
    open var lightGray: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.lightGray)
        }
    }

    /**
     Apply the color white to the active range(es)
     */
    open var white: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.white)
        }
    }

    /**
     Apply the color gray to the active range(es)
     */
    open var gray: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.gray)
        }
    }

    /**
     Apply the color red to the active range(es)
     */
    open var red: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.red)
        }
    }

    /**
     Apply the color green to the active range(es)
     */
    open var green: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.green)
        }
    }

    /**
     Apply the color blue to the active range(es)
     */
    open var blue: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.blue)
        }
    }

    /**
     Apply the color cyan to the active range(es)
     */
    open var cyan: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.cyan)
        }
    }

    /**
     Apply the color yellow to the active range(es)
     */
    open var yellow: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.yellow)
        }
    }
    
    /**
     Apply the color magenta to the active range(es)
     */
    open var magenta: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.magenta)
        }
    }
    
    /**
     Apply the color orange to the active range(es)
     */
    open var orange: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.orange)
        }
    }
    
    /**
     Apply the color purple to the active range(es)
     */
    open var purple: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.purple)
        }
    }
    
    /**
     Apply the color brown to the active range(es)
     */
    open var brown: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.brown)
        }
    }
    
    /**
     Apply the color clear to the active range(es)
     */
    open var clear: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: UIColor.clear)
        }
    }
    
    /**
     Apply a UIColor to the active range(es)
     
     -parameter color: The UIColor that will be applied.
     */
    open func color(_ color: UIColor) -> Attributer {
        return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: color)
    }
    
    /**
     Apply a color from a hex value to the active range(es)
     
     -parameter hex: The hex value of the color that will be applied.
     */
    open func color(_ hex: Int) -> Attributer {
        return applyAttributes(NSAttributedString.Key.foregroundColor.rawValue, value: colorFrom(hex: hex))
    }
    
    // MARK - Selection functions
    
    
    /**
     Make the active range the entire text
     */
    open var all: Attributer {
        get {
            ranges.removeAll()
            ranges.append(NSRange(location: 0, length: self.attributedText.length))
            return self
        }
    }
    
    /**
     Make the active range (from and to)
     
     -parameter from: The start of the new range
     -parameter to: The end of the new range.
     */
    open func range(_ from: Int, to: Int) -> Attributer {
        ranges.removeAll()
        ranges.append(NSRange(location: from, length: to - from))
        return self
    }
    
    /**
     Make the active range (location and length)
     
     -parameter location: The location of the new range
     -parameter length: The length of the new range.
     */
    open func range(_ location: Int, length: Int) -> Attributer {
        ranges.removeAll()
        ranges.append(NSRange(location: location, length: length))
        return self
    }
    
    
    /**
     Just set the active range
     
     -parameter range: The new range.
     */
    open func range(_ range: NSRange) -> Attributer {
        ranges.removeAll()
        ranges.append(range)
        return self
    }
    
    /**
     Find the first occurrance of a string (search with using .CompareOptions)
     
     -parameter substring: The string to search for.
     -parameter options: The search options
     */
    open func matchWithOptions(_ substring: String, _ options: NSString.CompareOptions = .literal) -> Attributer {
        let string = self.attributedText.string as NSString
        ranges.removeAll()
        ranges.append(string.range(of: substring, options: options))
        return self
    }
    
    /**
     Find the first occurrance of a string
     
     -parameter substring: The string to search for.
     */
    open func match(_ substring: String) -> Attributer {
        return matchWithOptions(substring)
    }
    
    /**
     Find the all occurrances of a string (search with using .CompareOptions)
     
     -parameter substring: The string to search for.
     -parameter options: The search options
     */
    open func matchAllWithOptions(_ substring: String, _ options: NSString.CompareOptions = .literal) -> Attributer {
        let string = self.attributedText.string as NSString
        var range = string.range(of: substring, options: options)
        ranges.removeAll()
        ranges.append(range)
        while range.length != 0 {
            let location = range.location + range.length
            let length = string.length - location
            range = string.range(of: substring, options: options, range: NSRange(location: location, length: length))
            ranges.append(range)
        }
        return self
    }
    
    /**
     Find the all occurrances of a string
     
     -parameter substring: The string to search for.
     */
    open func matchAll(_ substring: String) -> Attributer {
        return matchAllWithOptions(substring)
    }
    
    /**
     Find the all occurrances of any of the strings (search with using .CompareOptions)
     
     -parameter substring: An array of string to search for.
     -parameter options: The search options
     */
    open func matchAnyWithOptions(_ substrings: [String], _ options: NSString.CompareOptions = .literal) -> Attributer {
        let string = self.attributedText.string as NSString
        ranges.removeAll()
        for substring in substrings {
            var range = string.range(of: substring, options: options)
            ranges.append(range)
            while range.length != 0 {
                let location = range.location + range.length
                let length = string.length - location
                range = string.range(of: substring, options: options, range: NSRange(location: location, length: length))
                ranges.append(range)
            }
        }
        return self
    }

    /**
     Find the all occurrances of any of the strings
     
     -parameter substring: The array of strings to search for.
     */
    open func matchAny(_ substrings: [String]) -> Attributer {
        return matchAnyWithOptions(substrings)
    }

    /**
     Find the all hashtags (words beginning with #)
     */
    open var matchHashtags: Attributer {
        get {
            return matchPattern("#[\\p{L}0-9_]*")
        }
    }

    /**
     Find the all mentions (words beginning with @)
     */
    open var matchMentions: Attributer {
        get {
            return matchPattern("@[\\p{L}0-9_]*")
        }
    }

    /**
     Find the all links
     */
    open var matchLinks: Attributer {
        get {
            return matchPattern("(([\\w]+:)?//)?(([\\d\\w]|%[a-fA-f\\d]{2,2})+(:([\\d\\w]|%[a-fA-f\\d]{2,2})+)?@)?([\\d\\w][-\\d\\w]{0,253}[\\d\\w]\\.)+[\\w]{2,63}(:[\\d]+)?(/([-+_~.\\d\\w]|%[a-fA-f\\d]{2,2})*)*(\\?(&?([-+_~.\\d\\w]|%[a-fA-f\\d]{2,2})=?)*)?(#([-+_~.\\d\\w]|%[a-fA-f\\d]{2,2})*)?")
        }
    }

    /**
     Use a regular expression patter to find ranges
     
     -parameter pattern: The regex pattern.
     */
    open func matchPattern(_ pattern: String) -> Attributer {
        guard let elementRegex: NSRegularExpression = Attributer.regularExpression(for: pattern) else { return self }
        let range = NSRange(location: 0, length: (self.attributedText.string as NSString).length) // .characters.count is
        let results: [NSTextCheckingResult] = elementRegex.matches(in: self.attributedText.string, options: [], range: range)
        ranges = results.map { $0.range }
        return self
    }
    
    /**
     Append a string to the current attributed text and select the new string as the active range
     
     -parameter string: The string that will be added
     */
    open func append(_ string: String) -> Attributer {
        return self.append(NSMutableAttributedString(string: string))
    }

    /**
     Append a string to the current attributed text and select the new string as the active range
     
     -parameter string: The string that will be added
     */
    open func appendHtml(_ string: String) -> Attributer {
        return self.append(NSMutableAttributedString(html: string) ?? NSMutableAttributedString())
    }
    
    /**
     Append an attributed string to the current attributed text and select the new string as the active range
     
     -parameter attributedString: The attributed string that will be added
     */
    open func append(_ attributedString: NSMutableAttributedString) -> Attributer {
        ranges.removeAll()
        let rememberLength = self.attributedText.length
        self.attributedText.append(attributedString)
        ranges.append(NSRange(location: rememberLength, length: attributedString.length))
        return self
    }

    /**
     Append an Attributer to the current and select the new string as the active range
     
     -parameter attributer: The Attributer that will be added
     */
    open func append(_ attributer: Attributer) -> Attributer {
        for callback in attributer.urlCallbacks {
            self.urlCallbacks[callback.key] = callback.value
        }
        self.linkColor = attributer.linkColor ?? self.linkColor
        return self.append(attributer.attributedText)
        
    }

    

    // MARK: - Font
    
    /**
     Apply a font to the active range
     
     -parameter fontName: The name of the font that will be applied
     */
    open func fontName(_ fontName: String) -> Attributer {
        for range in self.ranges {
            guard range.location != NSNotFound else { return self }
            let substring = self.attributedText.attributedSubstring(from: range)
            if substring.length > 0, let font = substring.attribute(NSAttributedString.Key.font, at: 0, effectiveRange:nil) as? UIFont {
                if let currentFont = UIFont(name: fontName, size: font.pointSize) {
                    self.attributedText.addAttribute(NSAttributedString.Key.font, value: currentFont, range: range)
                }
            } else {
                if let currentFont = UIFont(name: fontName, size: UIFont.systemFontSize) {
                    self.attributedText.addAttribute(NSAttributedString.Key.font, value: currentFont, range: range)
                }
            }
        }
        return self
    }
    
    /**
     Apply a fontsize to the active range
     
     -parameter size: The fontsize that will be applied
     */
    open func size(_ size: CGFloat) -> Attributer {
        for range in self.ranges {
            guard range.location != NSNotFound else { return self }
            let substring = self.attributedText.attributedSubstring(from: range)
            if substring.length > 0, let font = substring.attribute(NSAttributedString.Key.font, at: 0, effectiveRange:nil) as? UIFont {
                self.attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont(name: font.fontName, size: size)!, range: range)
            } else {
                self.attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: size), range: range)
            }
        }
        return self
    }
    
    /**
     Apply a font to the active range
     
     -parameter font: The UIFont that will be applied
     */
    open func font(_ font: UIFont?) -> Attributer {
        if font != nil {
            return fontName(font!.fontName).size(font!.pointSize)
        }
        return self
    }
    
    
    // MARK: - Create a link
    
    /**
     Make the current active range interact. A touch will call the UITextViewDelegate which is handled in the AttributedTextView
     
     -parameter scheme: The scheme that will be added in front of the link
     */
    @available(*, deprecated, message: "use AttributedTextView with makeInteract: instead")
    open func makeInteractWithURLforScheme(_ scheme: String) -> Attributer {
        for nsRange in self.ranges {
            guard nsRange.location != NSNotFound else { return self }
            let iRange = self.attributedText.string.range(from: nsRange)
            if let escapedString = self.attributedText.string.substring(with: iRange!).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed) {
                self.attributedText.addAttribute(NSAttributedString.Key.link, value: "\(scheme):\(escapedString)", range: nsRange)
            }
        }
        return self
    }
    
    /**
     Make the current active range interact. A touch will call the UITextViewDelegate. When using the AttributedTextView the callback function will be called
     
     -parameter callback: The callback function that will be called when using AttributedTextView
     */
    open func makeInteract(_ callback: @escaping ((_ link: String) -> ())) -> Attributer {
        for nsRange in self.ranges {
            guard nsRange.location != NSNotFound else { return self }
            let unEscapedString = (self.attributedText.string as NSString).substring(with: nsRange)
                let escapedString = unEscapedString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed) ?? ""
            self.attributedText.addAttribute(NSAttributedString.Key.link, value: "AttributedTextView:\(escapedString)", range: nsRange)
                urlCallbacks[unEscapedString] = callback
            
        }
        return self
    }

    /**
     Used for setting the link color of the UITextView
     
     -parameter color: The color of all links
     */
    open func setLinkColor(_ color: UIColor) -> Attributer {
        linkColor = color
        return self
    }
    
    /**
     Called by AttributedTextView when a URL is touched
     
     -parameter URL: The URL that was touched
     */
    public func interactWithURL(URL: URL) {
        let unescapedString = URL.absoluteString.replacingOccurrences(of: "AttributedTextView:", with: "").removingPercentEncoding ?? ""
        urlCallbacks[unescapedString]?(unescapedString)
    }
    
    /**
     Make the current selected range a link
     
     -parameter link: The URL that will be forwarded to the UITextViewDelegate
     */
    open func link(_ link: URL) -> Attributer {
        return applyAttributes(NSAttributedString.Key.link.rawValue, value: link as AnyObject)
    }
    
    /**
     Make the current selected range a link
     
     -parameter link: The NSString that will be forwarded to the UITextViewDelegate
     */
    open func link(_ link: NSString) -> Attributer {
        return applyAttributes(NSAttributedString.Key.link.rawValue, value: link)
    }
    
    // MARK: - Style
    
    /**
     underline the active range
     */
    open var underline: Attributer {
        return underline(NSUnderlineStyle.single)
    }
    
    /**
     set the underline style for the active range (you also have to call .underline)
     
     -parameter underline: The underline style
     */
    open func underline(_ style: NSUnderlineStyle) -> Attributer {
        return applyAttributes(NSAttributedString.Key.underlineStyle.rawValue, value: style.rawValue as AnyObject)
    }
    
    /**
     set the underline style for the active range (you also have to call .underline)
     
     -parameter style: The underline style
     -parameter pattern : The underline pattern
     */
    open func underline(_ style: NSUnderlineStyle, _ pattern: NSUnderlineStyle) -> Attributer {
        return applyAttributes(NSAttributedString.Key.underlineStyle.rawValue, value: NSNumber(value: (style.rawValue | pattern.rawValue)))
    }
    
    /**
     set the underline color for the active range (you also have to call .underline)
     
     -parameter color: the UIColor of the undeline
     */
    open func underline(_ color: UIColor) -> Attributer {
        return applyAttributes(NSAttributedString.Key.underlineColor.rawValue, value: color)
    }
    
    /**
     set the underline color for the active range (you also have to call .underline)
     
     -parameter hex: the hex value of the color for the underline
     */
    open func underline(_ hex: Int) -> Attributer {
        return applyAttributes(NSAttributedString.Key.underlineColor.rawValue, value: colorFrom(hex: hex))
    }
    
    /**
     Attach an image to the range
     
     -parameter image: the UIImage that will be used as the attachment
     */
    open func attach(_ image: UIImage?, bounds: CGRect? = nil) -> Attributer {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        if let bounds = bounds {
            imageAttachment.bounds = bounds
        }
        self.attributedText.append(NSAttributedString(attachment: imageAttachment))
        return self
    }
    
    /**
     Attach an image to the range
     
     -parameter imageStr: the name of the image that will be used as the attachment
     */
    open func attach(_ imageStr: String, bounds: CGRect? = nil) -> Attributer {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: imageStr)
        if let bounds = bounds {
            imageAttachment.bounds = bounds
        }
        self.attributedText.append(NSAttributedString(attachment: imageAttachment))
        return self
    }
    
    /**
     Set the shadow for the active range(es)
     
     -parameter shadow: The NSShadow that will be set
     */
    open func shadow(_ shadow: NSShadow) -> Attributer {
        return applyAttributes(NSAttributedString.Key.shadow.rawValue, value: shadow)
    }

    /**
     Set the shadow for the active range(es)
     
     -parameter color: The UIColor for the shadow
     -parameter offset: The CGSize offset for the shadow
     -parameter blurRadius: The blurRadius for the shadow
     */
    open func shadow(color: UIColor?, offset: CGSize, blurRadius: CGFloat) -> Attributer {
        let shadow = NSShadow()
        shadow.shadowColor = color
        shadow.shadowOffset = offset
        shadow.shadowBlurRadius = blurRadius
        return applyAttributes(NSAttributedString.Key.shadow.rawValue, value: shadow)
    }
    
    /**
     Set the baseline offset for the active range(es)
     This will move the text up or down
     
     -parameter offset: The number of pixels that the text will be moved up or down.
     */
    open func baselineOffset(_ offset: NSNumber) -> Attributer {
        return applyAttributes(NSAttributedString.Key.baselineOffset.rawValue, value: offset)
    }
    
    /**
     Set the kern for the active range(es)
     This will set the spacing between letters
     
     -parameter number: The number of pixels that will be between the letters.
     */
    open func kern(_ number: NSNumber) -> Attributer {
        return applyAttributes(NSAttributedString.Key.kern.rawValue, value: number)
    }

    /**
     Set the striketrhough for the active range(es)
     
     -parameter number: The number of pixels the strikethrough will be high.
     */
    open func strikethrough(_ number: NSNumber) -> Attributer {
        return applyAttributes(NSAttributedString.Key.strikethroughStyle.rawValue, value: number)
    }
    
    /**
     Set the striketrhough color
     
     -parameter color: The strikethrough color.
     */
    open func strikethroughColor(_ color: UIColor) -> Attributer {
        return applyAttributes(NSAttributedString.Key.strikethroughColor.rawValue, value: color)
    }
    
    /**
     Set the stroke color
     
     -parameter color: The stroke color.
     */
    open func strokeColor(_ color: UIColor) -> Attributer {
        return applyAttributes(NSAttributedString.Key.strokeColor.rawValue, value: color)
    }

    /**
     Set the stroke width
     
     -parameter number: The stroke width.
     */
    open func strokeWidth(_ number: NSNumber) -> Attributer {
        return applyAttributes(NSAttributedString.Key.strokeWidth.rawValue, value: number)
    }

    /**
     Set the style to letterpress
     */
    open var letterpress: Attributer {
        get {
            return applyAttributes(NSAttributedString.Key.textEffect.rawValue, value: NSAttributedString.TextEffectStyle.letterpressStyle as NSString)
        }
    }
    
    /**
     Set the obliqueness

     -parameter number: The obliqueness.
     */
    open func obliqueness(_ number: NSNumber) -> Attributer {
        return applyAttributes(NSAttributedString.Key.obliqueness.rawValue, value: number)
    }

    /**
     Set the expansion
     
     -parameter number: The expansion.
     */
    open func expansion(_ number: NSNumber) -> Attributer {
        return applyAttributes(NSAttributedString.Key.expansion.rawValue, value: number)
    }

    /**
     "In iOS, horizontal text is always used and specifying a different value is undefined."
     
     Set the vertical Glyph form
     
     -parameter number: The vertical glyph form.
    open func verticalGlyphForm(_ number: NSNumber) -> Attributer {
        return applyAttributes(NSVerticalGlyphFormAttributeName, value: number)
    }
     */

    /**
     Set the backgroundColor
     
     -parameter color: The color.
     */
    open func backgroundColor(_ color: UIColor) -> Attributer {
        return applyAttributes(NSAttributedString.Key.backgroundColor.rawValue, value: color)
    }
    
    /**
     Set the ligature
     
     -parameter number: The ligature.
     */
    open func ligature(_ number: NSNumber) -> Attributer {
        return applyAttributes(NSAttributedString.Key.ligature.rawValue, value: number)
    }

    /**
     Set the attachment
     
     -parameter attachment: The attachment.
     */
    open func attachment(_ attachment: NSTextAttachment) -> Attributer {
        return applyAttributes(NSAttributedString.Key.attachment.rawValue, value: attachment)
    }
    
    /**
     Set the writing directions
     
     -parameter directions: The directions.
     */
    open func writingDirection(_ directions: [NSNumber]) -> Attributer {
        return applyAttributes(NSAttributedString.Key.writingDirection.rawValue, value: directions as AnyObject)
    }

    
    // MARK: - Paragraph functions
    
    /**
     Set the paragraph
     
     -parameter paragraph: The paragraph style.
     */
    open func paragraph(_ paragraph: NSMutableParagraphStyle) -> Attributer {
        return applyAttributes(NSAttributedString.Key.paragraphStyle.rawValue, value: paragraph)
    }

    /**
     Apply the paragraph stylings that have been set by all the paragraph functions
     */
    open var paragraphApplyStyling: Attributer {
        get {
            return paragraph(paragraphStyle)
        }
    }

    /**
     Align the paragraph in the center
     */
    open var paragraphAlignCenter: Attributer {
        get {
            paragraphStyle.alignment = NSTextAlignment.center
            return self
        }
    }

    /**
     Align the paragraph right
     */
    open var paragraphAlignRight: Attributer {
        get {
            paragraphStyle.alignment = NSTextAlignment.right
            return self
        }
    }

    /**
     Align the paragraph left
     */
    open var paragraphAlignLeft: Attributer {
        get {
            paragraphStyle.alignment = NSTextAlignment.left
            return self
        }
    }

    /**
     Align the paragraph justified
     */
    open var paragraphAlignJustified: Attributer {
        get {
            paragraphStyle.alignment = NSTextAlignment.justified
            return self
        }
    }

    /**
     Align the paragraph Natural
     */
    open var paragraphAlignNatural: Attributer {
        get {
            paragraphStyle.alignment = NSTextAlignment.natural
            return self
        }
    }
    
    /**
     Set the paragraph line spacing
     */
    open func paragraphLineSpacing(_ number: CGFloat) -> Attributer {
        paragraphStyle.lineSpacing = number
        return self
    }
    
    /**
     Set the paragraph spacing
     */
    open func paragraphSpacing(_ number: CGFloat) -> Attributer {
        paragraphStyle.paragraphSpacing = number
        return self
    }
    
    /**
     Set the paragraph first line head indent
     */
    open func paragraphFirstLineHeadIndent(_ number: CGFloat) -> Attributer {
        paragraphStyle.firstLineHeadIndent = number
        return self
    }
    
    /**
     Set the paragraph head indent
     */
    open func paragraphHeadIndent(_ number: CGFloat) -> Attributer {
        paragraphStyle.headIndent = number
        return self
    }
    
    /**
     Set the paragraph tail indent
     */
    open func paragraphTailIndent(_ number: CGFloat) -> Attributer {
        paragraphStyle.tailIndent = number
        return self
    }
    
    /**
     Set the paragraph linebreak mode to word wrapping
     */
    open var paragraphLineBreakModeWordWrapping: Attributer {
        get {
            paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
            return self
        }
    }

    /**
     Set the paragraph linebreak mode to character wrapping
     */
    open var paragraphLineBreakModeCharWrapping: Attributer {
        get {
            paragraphStyle.lineBreakMode = NSLineBreakMode.byCharWrapping
            return self
        }
    }

    /**
     Set the paragraph linebreak mode to clipping
     */
    open var paragraphLineBreakModeClipping: Attributer {
        get {
            paragraphStyle.lineBreakMode = NSLineBreakMode.byClipping
            return self
        }
    }

    /**
     Set the paragraph linebreak mode to truncate head
     */
    open var paragraphLineBreakTruncatingHead: Attributer {
        get {
            paragraphStyle.lineBreakMode = NSLineBreakMode.byTruncatingHead
            return self
        }
    }

    /**
     Set the paragraph linebreak mode to truncate tail
     */
    open var paragraphLineBreakTruncatingTail: Attributer {
        get {
            paragraphStyle.lineBreakMode = NSLineBreakMode.byTruncatingTail
            return self
        }
    }

    /**
     Set the paragraph linebreak mode to truncate midle
     */
    open var paragraphLineBreakTruncatingMiddle: Attributer {
        get {
            paragraphStyle.lineBreakMode = NSLineBreakMode.byTruncatingMiddle
            return self
        }
    }
    
    /**
     Set the paragraph minimum line height
     */
    open func paragraphMinimumLineHeight(_ number: CGFloat) -> Attributer {
        paragraphStyle.minimumLineHeight = number
        return self
    }

    /**
     Set the paragraph maximum line height
     */
    open func paragraphMaximumLineHeight(_ number: CGFloat) -> Attributer {
        paragraphStyle.maximumLineHeight = number
        return self
    }
    
    /**
     Set the paragraph base writing direction to natural
     */
    open var paragraphBaseWritingDirectionNatural: Attributer {
        get {
            paragraphStyle.baseWritingDirection = NSWritingDirection.natural
            return self
        }
    }

    /**
     Set the paragraph base writing direction to left to right
     */
    open var paragraphBaseWritingDirectionLeftToRight: Attributer {
        get {
            paragraphStyle.baseWritingDirection = NSWritingDirection.leftToRight
            return self
        }
    }

    /**
     Set the paragraph base writing direction to right to left
     */
    open var paragraphBaseWritingDirectionRightToLeft: Attributer {
        get {
            paragraphStyle.baseWritingDirection = NSWritingDirection.rightToLeft
            return self
        }
    }
    
    /**
     Set the paragraph line hight multiple
     */
    open func paragraphLineHeightMultiple(_ number: CGFloat) -> Attributer {
        paragraphStyle.lineHeightMultiple = number
        return self
    }
    
    /**
     Set the paragraph spacing before
     */
    open func paragraphSpacingBefore(_ number: CGFloat) -> Attributer {
        paragraphStyle.paragraphSpacingBefore = number
        return self
    }
    
    /**
     Set the paragraph hyphenation factor
     */
    open func paragraphHyphenationFactor(_ number: Float) -> Attributer {
        paragraphStyle.hyphenationFactor = number
        return self
    }
    
    /* Someone want this?
    @available(tvOS 7.0, *)
    open var tabStops: [NSTextTab]!
    
    @available(tvOS 7.0, *)
    open var defaultTabInterval: CGFloat
    
    @available(tvOS 9.0, *)
    open var allowsDefaultTighteningForTruncation: Bool
    
    
    @available(tvOS 9.0, *)
    open func addTabStop(_ anObject: NSTextTab)
    
    @available(tvOS 9.0, *)
    open func removeTabStop(_ anObject: NSTextTab)
    
    
    @available(tvOS 9.0, *)
    open func setParagraphStyle(_ obj: NSParagraphStyle)
    */
    

    // MARK: - Private
    
    @discardableResult
    fileprivate func applyAttributes(_ attributeName: String, value: AnyObject) -> Attributer {
        for range in self.ranges {
            guard range.location != NSNotFound else { return self }
            self.attributedText.addAttribute(NSAttributedString.Key(rawValue: attributeName), value: value, range: range)
        }
        return self
    }

    open func colorFrom(hex: Int) -> UIColor {
        return UIColor(hex: hex)
    }
    
    
    private static var cachedRegularExpressions: [String : NSRegularExpression] = [:]
    private static func regularExpression(for pattern: String) -> NSRegularExpression? {
        if let regex = cachedRegularExpressions[pattern] {
            return regex
        } else if let createdRegex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive]) {
            cachedRegularExpressions[pattern] = createdRegex
            return createdRegex
        } else {
            return nil
        }
    }
}

/**
 opperator for easy execution of the .append
 */
public func + (left: Attributer, right: Attributer) -> Attributer {
    return left.append(right)
}

/**
 Helper extension for converting a NSRange to a Range<String.Index>
 */
public extension String {
    /**
     Helper extension for converting a NSRange to a Range<String.Index>
     
     -parameter nsRange: The NSRange that needs to be converted
     */
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
}

/**
 Helper extension for creating a UIColor based on a hex value
 */
public extension UIColor {
    /**
     Helper extension for creating a UIColor based on a hex value

     -parameter hex: The hex value (like 0xffffff) that wil be used for the color
     */
    convenience init(hex: Int) {
        let red = CGFloat((hex & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00ff00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000ff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


