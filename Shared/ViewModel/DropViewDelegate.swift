//
//  DropViewDelegate.swift
//  SwiftUI_ReorderingGridViewItems (iOS)
//
//  Created by park kyung seok on 2021/10/21.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    
    var page: Page
    var viewModel: PageViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    
    // drag&dropが終わった時に呼ばれる
    func dropEntered(info: DropInfo) {
        
        // ここで self.pageは最後にdrag&dropが止まったもの
        print(page.url)
        
        let fromIndex = viewModel.urls.firstIndex { page -> Bool in
            viewModel.currentPage?.id == page.id
        } ?? 0
        
        let toIndex = viewModel.urls.firstIndex { page -> Bool in
            page.id == self.page.id
        } ?? 0
        
        //万が一のため
        guard fromIndex != toIndex else { return }
        
        let fromPage = viewModel.urls[fromIndex]
        
        withAnimation {
            // drag元のItemの配列にdropしたItemに差し替え
            viewModel.urls[fromIndex] = viewModel.urls[toIndex]
            
            viewModel.urls[toIndex] = fromPage
        }
    }
    
    // DropProposal:
    // The behavior of a drop : ドロップの動作?
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        DropProposal(operation: .move)
    }
}
