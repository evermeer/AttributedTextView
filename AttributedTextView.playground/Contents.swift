//: Playground - noun: a place where people can play.

// Since interaction is not working, clicking the links won't do anything.
// Please build the project first... First time rendering can take a minute


import AttributedTextView
import UIKit

// In interfacebuilder put an UITextView on the canvas and set the base class to AttributedTextView. For here we just create a new instance.
var textView1: AttributedTextView = AttributedTextView()

// First basic test
textView1.attributer =
    "1. ".red
    .append("This is the first test. ").green
    .append("Click on ").black
    .append("evict.nl").makeInteract { _ in
        UIApplication.shared.open(URL(string: "http://evict.nl")!, options: [:], completionHandler: { completed in })
    }.underline
    + " for testing links. ".black
    + "Next test".underline.makeInteract { _ in
        print("NEXT")
    }
    .all.font(UIFont(name: "SourceSansPro-Regular", size: 16))
    .setLinkColor(UIColor.purple) // Does not work in playground
var attributedText = textView1.attributedText // Vieuw the details for this -->

// You can also use the Attributer for your UILabel. You only can't use the makeInteract function
let myUILabel = UILabel()
myUILabel.attributedText = ("Just ".red + "some ".green + "text.".orange).attributedText
let showInPlayground = myUILabel.attributedText // Vieuw the details for this -->

// Some more attributes and now using + instead of .append
textView1.attributer =
    "2. red, ".red.underline.underline(0x00ff00)
    + "green, ".green.fontName("Helvetica").size(30)
    + "cyan, ".cyan.size(22)
    + "orange, ".orange.kern(10)
    + "blue, ".blue.strikethrough(3).baselineOffset(8)
    + "black.".shadow(color: UIColor.gray, offset: CGSize(width: 2, height: 3), blurRadius: 3.0)
attributedText = textView1.attributedText // Vieuw the details for this -->

// Match or matchAll
textView1.attributer = "It is this or it is that where the word is is selected".size(20)
    .match("is").underline.underline(UIColor.red)
    .matchAll("is").strikethrough(4)
attributedText = textView1.attributedText // Vieuw the details for this -->

// Match or matchAny
textView1.attributer = "The quick brown fox jumps over the lazy dog".size(20)
    .matchAny(["quick", "brown", "lazy"]).underline.underline(UIColor.red)
attributedText = textView1.attributedText // Vieuw the details for this -->


// Select hashtags or mentions
textView1.attributer = "@test: What #hashtags do we have in @evermeer #AtributedTextView library"
    .matchHashtags.underline
    .matchMentions
    .makeInteract { link in
        UIApplication.shared.open(URL(string: "https://twitter.com\(link.replacingOccurrences(of: "@", with: ""))")!, options: [:], completionHandler: { completed in })
    }
    .setLinkColor(UIColor.red) // Does not work in playground
attributedText = textView1.attributedText // Vieuw the details for this -->

// Select links
textView1.attributer = "link to http://evict.nl and https://github.com/evermeer"
    .matchLinks
    .makeInteract { link in
        UIApplication.shared.open(URL(string: link)!, options: [:], completionHandler: { completed in })
    }
attributedText = textView1.attributedText // View the details for this -->

textView1.attributer =  (
    "test stroke".strokeWidth(2).strokeColor(UIColor.red).paragraphAlignCenter.paragraphApplyStyling
    + "test stroke\n".strokeWidth(2).strokeColor(UIColor.blue)
    + "test strikethrough".strikethrough(2).strikethroughColor(UIColor.red)
    + " test strikethrough 2\n".strikethrough(2).strikethroughColor(UIColor.yellow)
    + "expansion\n".expansion(0.8).paragraphAlignRight.paragraphApplyStyling
    + ("letterpress ".letterpress
    + " obliquenes\n".obliqueness(0.4).backgroundColor(UIColor.cyan)).paragraphAlignLeft.paragraphApplyStyling
).all.size(24)
attributedText = textView1.attributedText // View the details for this -->

textView1.attributer = (
    "ligature fi and fl = ".ligature(0) + "fi and fl\n".ligature(1)
    + "0123456789".writingDirection([3])
).all.fontName("Hoefler Text").size(24)
attributedText = textView1.attributedText // View the details for this -->

textView1.attributer = (
    "The quick brown fox jumps over the lazy dog.\nPack my box with five dozen liquor jugs.\nSeveral fabulous dixieland jazz groups played with quick tempo.".paragraphLineHeightMultiple(5).paragraphLineSpacing(6).paragraphMinimumLineHeight(15).paragraphMaximumLineHeight(50).paragraphLineSpacing(10).paragraphLineBreakModeWordWrapping.paragraphFirstLineHeadIndent(20).paragraphApplyStyling
    ).all.size(12)
attributedText = textView1.attributedText // View the details for this -->

let rules = "Using backslash r has a strange effect on the last url if there is nothing behind it.\r\nhttp://serverurl.com/api.html\r\nhttp://serverurl.com/api2.html\r\nhttp://serverurl.com/api3.html"
textView1.attributer = rules.matchLinks
    .makeInteract({ link in
        print("\(link)")
    })
attributedText = textView1.attributedText // View the details for this -->


textView1.attributer = "And here we just do some tests with underline"
   .underline(.styleDouble, .patternDashDotDot)
attributedText = textView1.attributedText // View the details for this -->



textView1.attributer = "Edwin".red.fontName("Baskerville").size(15)
    .append("Edwin").gray.font(UIFont(name: "SourceSansPro-Regular", size: 15))
    .append("Edwin").makeInteract({ _ in
    }).fontName("Helvetica").size(15)
    .setLinkColor(.orange)
attributedText = textView1.attributedText // View the details for this -->



textView1.attributer = "My name is: <b>Edwin</b><br/>With a bulet list<br/><ul><li>item 1</li><li>item 2</li></ul>".html
attributedText = textView1.attributedText // View the details for this -->



