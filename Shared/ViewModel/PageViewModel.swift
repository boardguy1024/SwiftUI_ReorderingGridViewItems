//
//  PageViewModel.swift
//  SwiftUI_ReorderingGridViewItems (iOS)
//
//  Created by park kyung seok on 2021/10/21.
//

import SwiftUI

class PageViewModel: ObservableObject {
    
    @Published var selectedTab: String = "tabs"
    
    @Published var urls = [
        Page(url: URL(string: "http://www.google.com")!),
        Page(url: URL(string: "http://www.facebook.com")!),
        Page(url: URL(string: "http://www.apple.com")!),
        Page(url: URL(string: "http://www.twitter.com")!),
        Page(url: URL(string: "http://www.gmail.com")!),
        Page(url: URL(string: "http://www.instagram.com")!),
        Page(url: URL(string: "http://www.google.com")!),
        Page(url: URL(string: "http://www.facebook.com")!),
        Page(url: URL(string: "http://www.apple.com")!),
        Page(url: URL(string: "http://www.twitter.com")!),
        Page(url: URL(string: "http://www.google.com")!),
        Page(url: URL(string: "http://www.facebook.com")!),
        Page(url: URL(string: "http://www.apple.com")!),
        Page(url: URL(string: "http://www.twitter.com")!)
    ]

    @Published var currentPage: Page?
}
