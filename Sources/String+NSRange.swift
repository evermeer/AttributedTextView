//
//  String+NSRange.swift
//  AttributedTextView-iOS
//
//  Created by Edwin Vermeer on 18-06-18.
//  Copyright © 2018 evermeer. All rights reserved.
//

import Foundation

public extension String {
    func substring(with nsrange: NSRange) -> Substring? {
        guard let range = Range(nsrange, in: self) else { return nil }
        return self[range]
    }
}
