// swift-tools-version:5.5
//
//  AttributedTextView.swift
//  Restofire
//
//  Created by Edwin Vermeer on 23/10/15.
//  Copyright © 2016 evermeer. All rights reserved.

import PackageDescription

let packageName = "AttributedTextView"
let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v8),
    ],
    products: [
        .library(
            name: packageName,
            targets: [packageName]
        )
    ],
    dependencies: [
        // Stub
    ],
    targets: [
        .target(
            name: packageName,
            path: "Sources"
        ),
    ]
)
