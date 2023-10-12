//
//  AttributedTextView.swift
//  Restofire
//
//  Created by Edwin Vermeer on 23/10/15.
//  Copyright © 2016 evermeer. All rights reserved.
//
// swift-tools-version:5.5
import PackageDescription

let packageName = "AttributedTextView",
let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v8),
    ],
    products: [
        .library(name: packageName, targets: [packageName])
    ],
    dependencies: [
        // Stub
    ],
    target(name: packageName, path: "AttributedTextView/Sources")
    exclude: ["Tests"]
)
