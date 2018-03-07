//
//  NSAttributedString+Html.swift
//  AttributedTextView-iOS
//
//  Created by Edwin Vermeer on 07-03-18.
//  Copyright © 2018 evermeer. All rights reserved.
//

import Foundation
public extension NSMutableAttributedString {
    internal convenience init?(html: String) {
        guard let data = html.data(using: String.Encoding.utf16, allowLossyConversion: false) else {
            return nil
        }
        
        guard let attributedString = try?  NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil) else {
            return nil
        }
        
        self.init(attributedString: attributedString)
    }
}
