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
    
    // State of the Attributer
    open var string: NSMutableAttributedString
    public var linkColor: UIColor?

    fileprivate var urlCallbacks: [String : ((_ link: String) -> ())] = [:]
    fileprivate var ranges: [NSRange] = []
    
    /**
     Contructor method for Attributer
     
     Instantiate a new Attributer based on an attributed string
     
     -parameter string: The NSMutableAttributedString that will be used as the initial value of Attributer.
     */
    public init(_ string: NSMutableAttributedString) {
        self.string = string
        ranges.append(NSRange(location: 0, length: self.string.length))
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
    
    
    
    //MARK - Color functions
    
    
    /**
     Apply the color black to the active range(es)
     */
    open var black: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.black)
        }
    }

    /**
     Apply the color darkGray to the active range(es)
     */
    open var darkGray: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.darkGray)
        }
    }

    /**
     Apply the color lightGray to the active range(es)
     */
    open var lightGray: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.lightGray)
        }
    }

    /**
     Apply the color white to the active range(es)
     */
    open var white: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.white)
        }
    }

    /**
     Apply the color gray to the active range(es)
     */
    open var gray: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.gray)
        }
    }

    /**
     Apply the color red to the active range(es)
     */
    open var red: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.red)
        }
    }

    /**
     Apply the color green to the active range(es)
     */
    open var green: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.green)
        }
    }

    /**
     Apply the color blue to the active range(es)
     */
    open var blue: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.blue)
        }
    }

    /**
     Apply the color cyan to the active range(es)
     */
    open var cyan: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.cyan)
        }
    }

    /**
     Apply the color yellow to the active range(es)
     */
    open var yellow: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.yellow)
        }
    }
    
    /**
     Apply the color magenta to the active range(es)
     */
    open var magenta: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.magenta)
        }
    }
    
    /**
     Apply the color orange to the active range(es)
     */
    open var orange: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.orange)
        }
    }
    
    /**
     Apply the color purple to the active range(es)
     */
    open var purple: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.purple)
        }
    }
    
    /**
     Apply the color brown to the active range(es)
     */
    open var brown: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.brown)
        }
    }
    
    /**
     Apply the color clear to the active range(es)
     */
    open var clear: Attributer {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.clear)
        }
    }
    
    /**
     Apply a UIColor to the active range(es)
     
     -parameter color: The UIColor that will be applied.
     */
    open func color(_ color: UIColor) -> Attributer {
        return applyAttributes(NSForegroundColorAttributeName, value: color)
    }
    
    /**
     Apply a color from a hex value to the active range(es)
     
     -parameter hex: The hex value of the color that will be applied.
     */
    open func color(_ hex: Int) -> Attributer {
        return applyAttributes(NSForegroundColorAttributeName, value: colorFrom(hex: hex))
    }
    
    // MARK - Selection functions
    
    
    /**
     Make the active range the entire text
     */
    open var all: Attributer {
        get {
            ranges.removeAll()
            ranges.append(NSRange(location: 0, length: self.string.length))
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
        let string = self.string.string as NSString
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
        let string = self.string.string as NSString
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
    open func matchAll(_ substirng: String) -> Attributer {
        return matchAllWithOptions(substirng)
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
            return matchPattern("((https?://|www\\.|pic\\.)[-\\w;/?:@&=+$\\|\\_.!~*\\|'()\\[\\]%#,☺]+[\\w/#](\\(\\))?)(?=$|[\\s',\\|\\(\\).:;?\\-\\[\\]>\\)])")
        }
    }

    /**
     Use a regular expression patter to find ranges
     
     -parameter pattern: The regex pattern.
     */
    open func matchPattern(_ pattern: String) -> Attributer {
        guard let elementRegex: NSRegularExpression = Attributer.regularExpression(for: pattern) else { return self }
        let range = NSRange(location: 0, length: self.string.string.characters.count)
        let results: [NSTextCheckingResult] = elementRegex.matches(in: self.string.string, options: [], range: range)
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
     Append an attributed string to the current attributed text and select the new string as the active range
     
     -parameter attributedString: The attributed string that will be added
     */
    open func append(_ attributedString: NSMutableAttributedString) -> Attributer {
        ranges.removeAll()
        let rememberLength = self.string.length
        self.string.append(attributedString)
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
        return self.append(attributer.string)
        
    }

    

    // MARK: - Font
    
    /**
     Apply a font to the active range
     
     -parameter fontName: The name of the font that will be applied
     */
    open func fontName(_ fontName: String) -> Attributer {
        for range in self.ranges {
            if let font = self.string.attribute(NSFontAttributeName, at: 0, effectiveRange:nil) as? UIFont {
                if let currentFont = UIFont(name: fontName, size: font.pointSize) {
                    self.string.addAttribute(NSFontAttributeName, value: currentFont, range: range)
                }
            } else {
                if let currentFont = UIFont(name: fontName, size: UIFont.systemFontSize) {
                    self.string.addAttribute(NSFontAttributeName, value: currentFont, range: range)
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
            if let font = self.string.attribute(NSFontAttributeName, at: 0, effectiveRange:nil) as? UIFont {
                self.string.addAttribute(NSFontAttributeName, value: UIFont(name: font.fontName, size: size)!, range: range)
            } else {
                self.string.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: size), range: range)
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
    @available(*, deprecated, message: "use SwiftyTextView with makeInteract: instead")
    open func makeInteractWithURLforScheme(_ scheme: String) -> Attributer {
        for nsRange in self.ranges {
            let iRange = self.string.string.range(from: nsRange)
            if let escapedString = self.string.string.substring(with: iRange!).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed) {
                self.string.addAttribute(NSLinkAttributeName, value: "\(scheme):\(escapedString)", range: nsRange)
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
            let iRange = self.string.string.range(from: nsRange)
            if let escapedString = self.string.string.substring(with:  iRange!).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed) {
                self.string.addAttribute(NSLinkAttributeName, value: "SwiftyTextView:\(escapedString)", range: nsRange)
                urlCallbacks[escapedString] = callback
            }
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
        let escapedString = URL.absoluteString.replacingOccurrences(of: "SwiftyTextView:", with: "")
        urlCallbacks[escapedString]?(escapedString)
    }
    
    /**
     Make the current selected range a link
     
     -parameter link: The URL that will be forwarded to the UITextViewDelegate
     */
    open func link(_ link: URL) -> Attributer {
        return applyAttributes(NSLinkAttributeName, value: link as AnyObject)
    }
    
    /**
     Make the current selected range a link
     
     -parameter link: The NSString that will be forwarded to the UITextViewDelegate
     */
    open func link(_ link: NSString) -> Attributer {
        return applyAttributes(NSLinkAttributeName, value: link)
    }
    
    // MARK: - Style
    
    /**
     underline the active range
     */
    open var underline: Attributer {
        return underline(NSUnderlineStyle.styleSingle)
    }
    
    /**
     set the underline style for the active range (you also have to call .underline)
     
     -parameter underline: The underline style
     */
    open func underline(_ underline: NSUnderlineStyle) -> Attributer {
        return applyAttributes(NSUnderlineStyleAttributeName, value: underline.rawValue as AnyObject)
    }
    
    /**
     set the underline color for the active range (you also have to call .underline)
     
     -parameter color: the UIColor of the undeline
     */
    open func underline(_ color: UIColor) -> Attributer {
        return applyAttributes(NSUnderlineColorAttributeName, value: color)
    }
    
    /**
     set the underline color for the active range (you also have to call .underline)
     
     -parameter hex: the hex value of the color for the underline
     */
    open func underline(_ hex: Int) -> Attributer {
        return applyAttributes(NSUnderlineColorAttributeName, value: colorFrom(hex: hex))
    }
    
    /**
     Attach an image to the range
     
     -parameter image: the UIImage that will be used as the attachment
     */
    open func attach(_ image: UIImage?) -> Attributer {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        string.append(NSAttributedString(attachment: imageAttachment))
        return self
    }
    
    /**
     Attach an image to the range
     
     -parameter imageStr: the name of the image that will be used as the attachment
     */
    open func attach(_ imageStr: String) -> Attributer {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: imageStr)
        string.append(NSAttributedString(attachment: imageAttachment))
        return self
    }
    
    /**
     Set the shadow for the active range(es)
     
     -parameter shadow: The NSShadow that will be set
     */
    open func shadow(_ shadow: NSShadow) -> Attributer {
        return applyAttributes(NSShadowAttributeName, value: shadow)
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
        return applyAttributes(NSShadowAttributeName, value: shadow)
    }
    
    /**
     Set the baseline offset for the active range(es)
     This will move the text up or down
     
     -parameter offset: The number of pixels that the text will be moved up or down.
     */
    open func baselineOffset(_ offset: NSNumber) -> Attributer {
        return applyAttributes(NSBaselineOffsetAttributeName, value: offset)
    }
    
    /**
     Set the kern for the active range(es)
     This will set the spacing between letters
     
     -parameter number: The number of pixels that will be between the letters.
     */
    open func kern(_ number: NSNumber) -> Attributer {
        return applyAttributes(NSKernAttributeName, value: number)
    }

    /**
     Set the striketrhough for the active range(es)
     
     -parameter number: The number of pixels the strikethrough will be high.
     */
    open func strikethrough(_ number: NSNumber) -> Attributer {
        return applyAttributes(NSStrikethroughStyleAttributeName, value: number)
    }

    //TODO:
    //NSStrikethroughColorAttributeName -> UIColor
    //NSStrokeColorAttributeName -> UIColor
    //NSStrokeWidthAttributeName --> NSNumber
    //NSTextEffectAttributeName --> NSString
    //NSObliquenessAttributeName -> NSNumber
    //NSExpansionAttributeName -> NSNumber
    //NSVerticalGlyphFormAttributeName -> NSNumber
    //NSBackgroundColorAttributeName -> UIColor
    
    
    // MARK: - Private
    
    @discardableResult
    fileprivate func applyAttributes(_ attributeName: String, value: AnyObject) -> Attributer {
        for range in self.ranges {
            self.string.addAttribute(attributeName, value: value, range: range)
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
    public func range(from nsRange: NSRange) -> Range<String.Index>? {
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
    public convenience init(hex: Int) {
        let red = CGFloat((hex & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00ff00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000ff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


