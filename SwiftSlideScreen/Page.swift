//
//  Page.swift
//  SwiftSlideScreen
//
//  Created by Keita Nakashima on 2024/12/13.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "Description Example", imageUrl: "0", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Title 1", description: "Description 1", imageUrl: "0", tag: 0),
        Page(name: "Title 2", description: "Description 2", imageUrl: "1", tag: 1),
        Page(name: "Title 3", description: "Description 3", imageUrl: "2", tag: 2),
    ]
}
