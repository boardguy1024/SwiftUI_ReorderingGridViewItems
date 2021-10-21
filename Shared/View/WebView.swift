//
//  WebView.swift
//  SwiftUI_ReorderingGridViewItems (iOS)
//
//  Created by park kyung seok on 2021/10/21.
//

import SwiftUI
import WebKit

// WebView From UIKit

struct WebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        
        let view = WKWebView()
        view.isUserInteractionEnabled = false // drag&dropが効かないため、falseに設定
        view.transform = CGAffineTransform.init(scaleX: 0.3, y: 0.3)
        view.load(URLRequest(url: url))
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
