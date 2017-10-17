//
//  CGFloatDP.swift
//  AttributedTextView
//
//  Created by Vermeer, Edwin on 05/10/2017.
//  Copyright © 2017 evermeer. All rights reserved.
//

import UIKit

extension CGFloat {
    /**
     The relative dimension to the corresponding screen size.
     
     //Usage
     let someView = UIView(frame: CGRect(x: 0, y: 0, width: 320.dp, height: 40.dp)
     
     **Warning** Only works with size references from @1x mockups.
     
     The 320 corresponds with your design size. You can change it to:
     iPhone 6, 7, 8 Plus — 414
     iPhone 6, 7, 8, X — 375
     
     */
    var dp: CGFloat {
        return (self / 320) * UIScreen.main.bounds.width
    }
}
