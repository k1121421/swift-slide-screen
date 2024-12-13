//
//  PageView.swift
//  SwiftSlideScreen
//
//  Created by Keita Nakashima on 2024/12/13.
//

import SwiftUI

struct PageView: View {
    var page: Page
    var currentIndex: Int
    var pageIndex: Int
    
    @State private var fadeIn: Bool = false
    @State private var hasAppeared: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            
            Spacer().frame(height: 26)
            
            Text(page.name)
                .font(.system(size: 34))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .opacity(fadeIn ? 1 : 0)
                .offset(y: fadeIn ? 0 : -5)
                .animation(.easeInOut(duration: 0.5), value: fadeIn)
            
            Spacer().frame(height: 8)
            
            Text(page.description)
                .font(.system(size: 24))
                .foregroundColor(.black)
                .frame(width: 300)
                .multilineTextAlignment(.center)
                .opacity(fadeIn ? 1 : 0)
                .offset(y: fadeIn ? 0 : -5)
                .animation(.easeInOut(duration: 0.5), value: fadeIn)
            
            Spacer().frame(height: 30)
            
            Image("\(page.imageUrl)")
                .resizable()
                .background(.gray.opacity(0.50))
                .frame(width: 300)
                .padding(.horizontal)
        }
        .onChange(of: currentIndex) {
            if currentIndex == pageIndex, !hasAppeared {
                fadeIn = true
                hasAppeared = true
            }
        }
        .onAppear {
            if currentIndex == pageIndex, !hasAppeared {
                fadeIn = true
                hasAppeared = true
            }
        }
    }
}

#Preview {
    PageView(page: Page.samplePage, currentIndex: 0, pageIndex: 0)
}
