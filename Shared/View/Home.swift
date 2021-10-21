//
//  Home.swift
//  SwiftUI_ReorderingGridViewItems (iOS)
//
//  Created by park kyung seok on 2021/10/21.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel = PageViewModel()
    
    @Namespace var animation
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 45), count: 2)
    
    var body: some View {
        
        VStack {
            
            // Custom Picker
            
            HStack {
                Image(systemName: "eyeglasses")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(viewModel.selectedTab == "private" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack {
                            if viewModel.selectedTab == "private" {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            } else {
                                Color.clear
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation {
                            viewModel.selectedTab = "private"
                        }
                    }
                    
                Text("1")
                    .frame(width: 35, height: 35)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(viewModel.selectedTab == "tabs" ? Color.black : Color.white, lineWidth: 3))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(viewModel.selectedTab == "tabs" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack {
                            if viewModel.selectedTab == "tabs" {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            } else {
                                Color.clear
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation {
                            viewModel.selectedTab = "tabs"
                        }
                    }
                
                Image(systemName: "laptopcomputer")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(viewModel.selectedTab == "device" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack {
                            if viewModel.selectedTab == "device" {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            } else {
                                Color.clear
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation {
                            viewModel.selectedTab = "device"
                        }
                    }
            }
            .background(Color.white.opacity(0.15))
            .cornerRadius(10)
            .padding(.top)
            
            ScrollView {
                
                LazyVGrid(columns: columns, spacing: 20, content: {
                  
                    ForEach(viewModel.urls) { page in
                        
                        WebView(url: page.url)
                            .frame(height: 200)
                            .cornerRadius(15)
                            // Drag and Drop
                            .onDrag({
                                
                                // setting Current Page
                                viewModel.currentPage = page
                                
                                // Sanding id
                                return NSItemProvider(contentsOf: URL(string: "\(page.id)")!)!
                            })
                            .onDrop(of: [.url], delegate: DropViewDelegate(page: page, viewModel: viewModel))
                    }
                })
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea(.all, edges: .all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
