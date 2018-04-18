//
//  String+Attributer.swift
//
//  Created by Edwin Vermeer on 25/11/2016.
//  Copyright © 2016 Edwin Vermeer. All rights reserved.
//

import UIKit

public extension String {
    
    /**
     Easy access to the Attributer object
     */
    public var attributer: Attributer {
        get {
            return Attributer(self)
        }
    }
    
    // All functions below just forward the call to the Attributer 
    
    
    // MARK: - Color functions
    
    /**
     Apply the color black to the active range(es)
     */
    public var black: Attributer {
        get {
            return attributer.black
        }
    }
    
    /**
     Apply the color darkGray to the active range(es)
     */
    public var darkGray: Attributer {
        get {
            return attributer.darkGray
        }
    }
    
    /**
     Apply the color lightGray to the active range(es)
     */
    public var lightGray: Attributer {
        get {
            return attributer.lightGray
        }
    }
    
    /**
     Apply the color white to the active range(es)
     */
    public var white: Attributer {
        get {
            return attributer.white
        }
    }
    
    /**
     Apply the color gray to the active range(es)
     */
    public var gray: Attributer {
        get {
            return attributer.gray
        }
    }
    
    /**
     Apply the color red to the active range(es)
     */
    public var red: Attributer {
        get {
            return attributer.red
        }
    }
    
    /**
     Apply the color green to the active range(es)
     */
    public var green: Attributer {
        get {
            return attributer.green
        }
    }
    
    /**
     Apply the color blue to the active range(es)
     */
    public var blue: Attributer {
        get {
            return attributer.blue
        }
    }
    
    /**
     Apply the color cyan to the active range(es)
     */
    public var cyan: Attributer {
        get {
            return attributer.cyan
        }
    }
    
    /**
     Apply the color yellow to the active range(es)
     */
    public var yellow: Attributer {
        get {
            return attributer.yellow
        }
    }
    
    /**
     Apply the color magenta to the active range(es)
     */
    public var magenta: Attributer {
        get {
            return attributer.magenta
        }
    }
    
    /**
     Apply the color orange to the active range(es)
     */
    public var orange: Attributer {
        get {
            return attributer.orange
        }
    }
    
    /**
     Apply the color purple to the active range(es)
     */
    public var purple: Attributer {
        get {
            return attributer.purple
        }
    }
    
    /**
     Apply the color brown to the active range(es)
     */
    public var brown: Attributer {
        get {
            return attributer.brown
        }
    }
    
    /**
     Apply the color clear to the active range(es)
     */
    public var clear: Attributer {
        get {
            return attributer.clear
        }
    }
    
    /**
     Apply a UIColor to the active range(es)
     
     -parameter color: The UIColor that will be applied.
     */
    public func color(_ color: UIColor) -> Attributer {
        return attributer.color(color)
    }
    
    /**
     Apply a color from a hex value to the active range(es)
     
     -parameter hex: The hex value of the color that will be applied.
     */
    public func color(_ hex: Int) -> Attributer {
        return attributer.color(hex)
    }
    
    // MARK: - Selection functions
    
    /**
     Make the active range the entire text
     */
    public var all: Attributer {
        get {
            return attributer.all
        }
    }
    
    /**
     Make the active range (from and to)
     
     -parameter from: The start of the new range
     -parameter to: The end of the new range.
     */
    public func range(_ from: Int, to: Int) -> Attributer {
        return attributer.range(from, to: to)
    }
    
    /**
     Make the active range (location and length)
     
     -parameter location: The location of the new range
     -parameter length: The length of the new range.
     */
    public func range(_ location: Int, length: Int) -> Attributer {
        return attributer.range(location, length: length)
    }
    
    /**
     Just set the active range
     
     -parameter range: The new range.
     */
    public func range(_ range: NSRange) -> Attributer {
        return attributer.range(range)
    }
    
    /**
     Find the first occurrance of a string (search with using .CompareOptions)
     
     -parameter substring: The string to search for.
     -parameter options: The search options
     */
    public func matchWithOptions(_ substring: String, _ options: NSString.CompareOptions = .literal) -> Attributer {
        return attributer.matchWithOptions(substring, options)
    }
    
    /**
     Find the first occurrance of a string
     
     -parameter substring: The string to search for.
     */
    public func match(_ substring: String) -> Attributer {
        return attributer.match(substring)
    }
    
    /**
     Find the all occurrances of a string (search with using .CompareOptions)
     
     -parameter substring: The string to search for.
     -parameter options: The search options
     */
    public func matchAllWithOptions(_ substring: String, _ options: NSString.CompareOptions = .literal) -> Attributer {
        return attributer.matchAllWithOptions(substring, options)
    }
    
    /**
     Find the all occurrances of a string
     
     -parameter substring: The string to search for.
     */
    public func matchAll(_ substring: String) -> Attributer {
        return attributer.matchAll(substring)
    }
    
    /**
     Find the all hashtags (words beginning with #)
     */
    public var matchHashtags: Attributer {
        get {
            return attributer.matchHashtags
        }
    }
    
    /**
     Find the all mentions (words beginning with @)
     */
    public var matchMentions: Attributer {
        get {
            return attributer.matchMentions
        }
    }
    
    /**
     Find the all links
     */
    public var matchLinks: Attributer {
        get {
            return attributer.matchLinks
        }
    }

    /**
     Use a regular expression patter to find ranges
     
     -parameter pattern: The regex pattern.
     */
    public func matchPattern(_ pattern: String) -> Attributer {
        return attributer.matchPattern(pattern)
    }
    
    /**
     Append a string to the current attributed text and select the new string as the active range
     
     -parameter string: The string that will be added
     */
    public func append(string: String) -> Attributer {
        return attributer.append(string)
    }
    
    /**
     Append an attributed string to the current attributed text and select the new string as the active range
     
     -parameter attributedString: The attributed string that will be added
     */
    public func append(_ attributedString: NSMutableAttributedString) -> Attributer {
        return attributer.append(attributedString)
    }
    
    /**
     Append an Attributer to the current and select the new string as the active range
     
     -parameter attributer: The Attributer that will be added
     */
    public func append(_ attributer: Attributer) -> Attributer {
        return attributer.append(attributer)
    }
    
    
    // MARK: - Font
    
    /**
     Apply a font to the active range
     
     -parameter fontName: The name of the font that will be applied
     */
    public func fontName(_ fontName: String) -> Attributer {
        return attributer.fontName(fontName)
    }
    
    /**
     Apply a fontsize to the active range
     
     -parameter size: The fontsize that will be applied
     */
    public func size(_ size: CGFloat) -> Attributer {
        return attributer.size(size)
    }
    
    /**
     Apply a font to the active range
     
     -parameter font: The UIFont that will be applied
     */
    public func font(_ font: UIFont) -> Attributer {
        return attributer.font(font)
    }

    
    // MARK: - Create a link
    
    /**
     Make the current active range interact. A touch will call the UITextViewDelegate which is handled in the AttributedTextView
     
     -parameter scheme: The scheme that will be added in front of the link
     */
    @available(*, deprecated, message: "use AttributedTextView with makeInteract: instead")
    public func makeInteractWithURLforScheme(_ scheme: String) -> Attributer {
        return attributer.makeInteractWithURLforScheme(scheme)
    }
    
    /**
     Make the current active range interact. A touch will call the UITextViewDelegate. When using the AttributedTextView the callback function will be called
     
     -parameter callback: The callback function that will be called when using AttributedTextView
     */
    public func makeInteract(_ callback: @escaping ((_ link: String) -> ())) -> Attributer {
        return attributer.makeInteract(callback)
    }
    
    /**
     Used for setting the link color of the UITextView
     
     -parameter color: The color of all links
     */
    public func setLinkColor(_ color: UIColor) -> Attributer {
        return attributer.setLinkColor(color)
    }
    
    /**
     Called by AttributedTextView when a URL is touched
     
     -parameter URL: The URL that was touched
     */
    public func interactWithURL(URL: URL) {
        return attributer.interactWithURL(URL: URL)
    }
    
    /**
     Make the current selected range a link
     
     -parameter link: The URL that will be forwarded to the UITextViewDelegate
     */
    public func link(_ link: URL) -> Attributer {
        return attributer.link(link)
    }
    
    /**
     Make the current selected range a link
     
     -parameter link: The NSString that will be forwarded to the UITextViewDelegate
     */
    public func link(_ link: NSString) -> Attributer {
        return attributer.link(link)
    }

    // MARK: - Style
    
    /**
     underline the active range
     */
    public var underline: Attributer {
        return attributer.underline
    }
    
    /**
     set the underline style for the active range (you also have to call .underline)
     
     -parameter underline: The underline style
     */
    public func underline(_ underline: NSUnderlineStyle) -> Attributer {
        return attributer.underline(underline)
    }
    
    /**
     set the underline style for the active range (you also have to call .underline)
     
    -parameter style: The underline style
    -parameter pattern : The underline pattern
    */
    public func underline(_ style: NSUnderlineStyle, _ pattern: NSUnderlineStyle) -> Attributer {
        return attributer.underline(style, pattern)
    }
    
    /**
     set the underline color for the active range (you also have to call .underline)
     
     -parameter color: the UIColor of the undeline
     */
    public func underline(_ color: UIColor) -> Attributer {
        return attributer.underline(color)
    }
    
    /**
     set the underline color for the active range (you also have to call .underline)
     
     -parameter hex: the hex value of the color for the underline
     */
    public func underline(_ hex: Int) -> Attributer {
        return attributer.underline(hex)
    }
    
    /**
     Attach an image to the range
     
     -parameter image: the UIImage that will be used as the attachment
     */
    public func attach(_ image: UIImage?, bounds: CGRect? = nil) -> Attributer {
        return attributer.attach(image, bounds: bounds)
    }
    
    /**
     Attach an image to the range
     
     -parameter imageStr: the name of the image that will be used as the attachment
     */
    public func attach(_ imageStr: String, bounds: CGRect? = nil) -> Attributer {
        return attributer.attach(imageStr, bounds: bounds)
    }
    
    /**
     Set the shadow for the active range(es)
     
     -parameter shadow: The NSShadow that will be set
     */
    public func shadow(_ shadow: NSShadow) -> Attributer {
        return attributer.shadow(shadow)
    }
    
    /**
     Set the shadow for the active range(es)
     
     -parameter color: The UIColor for the shadow
     -parameter offset: The CGSize offset for the shadow
     -parameter blurRadius: The blurRadius for the shadow
     */
    public  func shadow(color: UIColor?, offset: CGSize, blurRadius: CGFloat) -> Attributer {
        return attributer.shadow(color: color, offset: offset, blurRadius: blurRadius)
    }
    
    /**
     Set the baseline offset for the active range(es)
     This will move the text up or down
     
     -parameter offset: The number of pixels that the text will be moved up or down.
     */
    public func baselineOffset(_ offset: NSNumber) -> Attributer {
        return attributer.baselineOffset(offset)
    }
    
    /**
     Set the kern for the active range(es)
     This will set the spacing between letters
     
     -parameter number: The number of pixels that will be between the letters.
     */
    public func kern(_ number: NSNumber) -> Attributer {
        return attributer.kern(number)
    }
    
    /**
     Set the striketrhough for the active range(es)
     
     -parameter number: The number of pixels the strikethrough will be high.
     */
    public func strikethrough(_ number: NSNumber) -> Attributer {
        return attributer.strikethrough(number)
    }

    
    /**
     Set the striketrhough color for the active range(es)
     
     -parameter color: The color of the striketrhough.
     */
    public func strikethroughColor(_ color: UIColor) -> Attributer {
        return attributer.strikethroughColor(color)
    }
    
    /**
     Set the stroke color
     
     -parameter color: The stroke color.
     */
    public func strokeColor(_ color: UIColor) -> Attributer {
        return attributer.strokeColor(color)
    }
    
    /**
     Set the stroke width
     
     -parameter number: The stroke width.
     */
    public func strokeWidth(_ number: NSNumber) -> Attributer {
        return attributer.strokeWidth(number)
    }
    
    /**
     Set the style to letterpress
     */
    public var letterpress: Attributer {
        get {
            return attributer.letterpress
        }
    }
    
    /**
     Set the obliqueness
     
     -parameter number: The obliqueness.
     */
    public func obliqueness(_ number: NSNumber) -> Attributer {
        return attributer.obliqueness(number)
    }
    
    /**
     Set the expansion
     
     -parameter number: The expansion.
     */
    public func expansion(_ number: NSNumber) -> Attributer {
        return attributer.expansion(number)
    }
    
    /*
     "In iOS, horizontal text is always used and specifying a different value is undefined."
    
     public func verticalGlyphForm(_ number: NSNumber) -> Attributer {
        return attributer.verticalGlyphForm(number)
    }
    */
    
    /**
     Set the backgroundColor
     
     -parameter color: The color.
     */
    public func backgroundColor(_ color: UIColor) -> Attributer {
        return attributer.backgroundColor(color)
    }
    
    /**
     Set the ligature
     
     -parameter number: The ligature.
     */
    public func ligature(_ number: NSNumber) -> Attributer {
        return attributer.ligature(number)
    }
    
    /**
     Set the attachment
     
     -parameter attachment: The attachment.
     */
    public func attachment(_ attachment: NSTextAttachment) -> Attributer {
        return attributer.attachment(attachment)
    }
    
    /**
     Set the writing directions
     
     -parameter directions: The directions.
     */
    public func writingDirection(_ directions: [NSNumber]) -> Attributer {
        return attributer.writingDirection(directions)
    }
    
    
    // MARK: - Paragraph functions
    
    /**
     Set the paragraph
     
     -parameter paragraph: The paragraph style.
     */
    public func paragraph(_ paragraph: NSMutableParagraphStyle) -> Attributer {
        return attributer.paragraph(paragraph)
    }
    
    /**
     Apply the paragraph stylings that have been set by all the paragraph functions
     */
    public var paragraphApplyStyling: Attributer {
        get {
            return attributer.paragraphApplyStyling
        }
    }
    
    /**
     Align the paragraph in the center
     */
    public var paragraphAlignCenter: Attributer {
        get {
            return attributer.paragraphAlignCenter
        }
    }
    
    /**
     Align the paragraph right
     */
    public var paragraphAlignRight: Attributer {
        get {
            return attributer.paragraphAlignRight
        }
    }
    
    /**
     Align the paragraph left
     */
    public var paragraphAlignLeft: Attributer {
        get {
            return attributer.paragraphAlignLeft
        }
    }
    
    /**
     Align the paragraph justified
     */
    public var paragraphAlignJustified: Attributer {
        get {
            return attributer.paragraphAlignJustified
        }
    }
    
    /**
     Align the paragraph Natural
     */
    public var paragraphAlignNatural: Attributer {
        get {
            return attributer.paragraphAlignNatural
        }
    }
    
    /**
     Set the paragraph line spacing
     */
    public func paragraphLineSpacing(_ number: CGFloat) -> Attributer {
        return attributer.paragraphLineSpacing(number)
    }
    
    /**
     Set the paragraph spacing
     */
    public func paragraphSpacing(_ number: CGFloat) -> Attributer {
        return attributer.paragraphSpacing(number)
    }
    
    /**
     Set the paragraph first line head indent
     */
    public func paragraphFirstLineHeadIndent(_ number: CGFloat) -> Attributer {
        return attributer.paragraphFirstLineHeadIndent(number)
    }
    
    /**
     Set the paragraph head indent
     */
    public func paragraphHeadIndent(_ number: CGFloat) -> Attributer {
        return attributer.paragraphHeadIndent(number)
    }
    
    /**
     Set the paragraph tail indent
     */
    public func paragraphTailIndent(_ number: CGFloat) -> Attributer {
        return attributer.paragraphTailIndent(number)
    }
    
    /**
     Set the paragraph linebreak mode to word wrapping
     */
    public var paragraphLineBreakModeWordWrapping: Attributer {
        get {
            return attributer.paragraphLineBreakModeWordWrapping
        }
    }
    
    /**
     Set the paragraph linebreak mode to character wrapping
     */
    public var paragraphLineBreakModeCharWrapping: Attributer {
        get {
            return attributer.paragraphLineBreakModeCharWrapping
        }
    }
    
    /**
     Set the paragraph linebreak mode to clipping
     */
    public var paragraphLineBreakModeClipping: Attributer {
        get {
            return attributer.paragraphLineBreakModeClipping
        }
    }
    
    /**
     Set the paragraph linebreak mode to truncate head
     */
    public var paragraphLineBreakTruncatingHead: Attributer {
        get {
            return attributer.paragraphLineBreakTruncatingHead
        }
    }
    
    /**
     Set the paragraph linebreak mode to truncate tail
     */
    public var paragraphLineBreakTruncatingTail: Attributer {
        get {
            return attributer.paragraphLineBreakTruncatingTail
        }
    }
    
    /**
     Set the paragraph linebreak mode to truncate midle
     */
    public var paragraphLineBreakTruncatingMiddle: Attributer {
        get {
            return attributer.paragraphLineBreakTruncatingMiddle
        }
    }
    
    /**
     Set the paragraph minimum line height
     */
    public func paragraphMinimumLineHeight(_ number: CGFloat) -> Attributer {
        return attributer.paragraphMinimumLineHeight(number)
    }
    
    /**
     Set the paragraph maximum line height
     */
    public func paragraphMaximumLineHeight(_ number: CGFloat) -> Attributer {
        return attributer.paragraphMaximumLineHeight(number)
    }
    
    /**
     Set the paragraph base writing direction to natural
     */
    public var paragraphBaseWritingDirectionNatural: Attributer {
        get {
            return attributer.paragraphBaseWritingDirectionNatural
        }
    }
    
    /**
     Set the paragraph base writing direction to left to right
     */
    public var paragraphBaseWritingDirectionLeftToRight: Attributer {
        get {
            return attributer.paragraphBaseWritingDirectionLeftToRight
        }
    }
    
    /**
     Set the paragraph base writing direction to right to left
     */
    public var paragraphBaseWritingDirectionRightToLeft: Attributer {
        get {
            return attributer.paragraphBaseWritingDirectionRightToLeft
        }
    }
    
    /**
     Set the paragraph line hight multiple
     */
    public func paragraphLineHeightMultiple(_ number: CGFloat) -> Attributer {
        return attributer.paragraphLineHeightMultiple(number)
    }
    
    /**
     Set the paragraph spacing before
     */
    public func paragraphSpacingBefore(_ number: CGFloat) -> Attributer {
        return attributer.paragraphSpacingBefore(number)
    }
    
    /**
     Set the paragraph hyphenation factor
     */
    public func paragraphHyphenationFactor(_ number: Float) -> Attributer {
        return attributer.paragraphHyphenationFactor(number)
    }
    
    public var html: Attributer { get {
            return Attributer(NSMutableAttributedString(html: self) ?? NSMutableAttributedString())
        }
    }
    
    /* Someone want this?
     @available(tvOS 7.0, *)
     public var tabStops: [NSTextTab]!
     
     @available(tvOS 7.0, *)
     public var defaultTabInterval: CGFloat
     
     @available(tvOS 9.0, *)
     public var allowsDefaultTighteningForTruncation: Bool
     
     
     @available(tvOS 9.0, *)
     public func addTabStop(_ anObject: NSTextTab)
     
     @available(tvOS 9.0, *)
     public func removeTabStop(_ anObject: NSTextTab)
     
     
     @available(tvOS 9.0, *)
     public func setParagraphStyle(_ obj: NSParagraphStyle)
     */    
}
