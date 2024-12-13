//
//  ContentView.swift
//  SwiftSlideScreen
//
//  Created by Keita Nakashima on 2024/12/13.
//

import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    
    private let pages: [Page] = Page.samplePages
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $pageIndex) {
                ForEach(pages.indices, id: \.self) { index in
                    VStack {
                        Spacer()
                        PageView(page: pages[index],
                                 currentIndex: pageIndex,
                                 pageIndex: index)
                    }
                    .tag(index)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // disable dot
            
            VStack(spacing: 0) {
                
                Spacer().frame(height: 4)
                
                // custom page indicator
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        Circle()
                            .fill(index == pageIndex ? Color.black : Color.gray.opacity(0.5))
                            .frame(width: 10, height: 10)
                            .animation(.easeInOut, value: pageIndex)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Spacer().frame(height: 40)
            }
            .background(.white)
            .shadow(radius: 15)
            
        }
        .containerRelativeFrame([.horizontal, .vertical])
    }
}

#Preview {
    ContentView()
}
