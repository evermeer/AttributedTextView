//: Playground - noun: a place where people can play.

// Since interaction is not working, clicking the links won't do anything.

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
myUILabel.attributedText = ("Just ".red + "some ".green + "text.".orange).string
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
    "test stroke".strokeWidth(2).strokeColor(UIColor.red)
    + "test stroke 2\n".strokeWidth(2).strokeColor(UIColor.blue)
    + "test strikethrough".strikethrough(2).strikethroughColor(UIColor.red)
    + " test strikethrough 2\n".strikethrough(2).strikethroughColor(UIColor.yellow)
    + "letterpress ".letterpress
    + " obliquenes\n".obliqueness(0.4).backgroundColor(UIColor.cyan)
    + "expansion\n".expansion(0.8)
).all.size(24)

attributedText = textView1.attributedText // View the details for this -->

textView1.attributer = ("".attributer
    + "ligature fi and fl = ".ligature(0) + "fi and fl\n".ligature(1)
    + "writingDirection".writingDirection([3])
).all.fontName("Hoefler Text").size(24)
attributedText = textView1.attributedText // View the details for this -->




