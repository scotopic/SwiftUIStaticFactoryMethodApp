//
//  ContentView.swift
//  Shared
//
//  Created by alexseven on 3/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            // approach 1 - Quick and reusable as copy/paste
            VStack(alignment: .leading, spacing: nil, content: {
                Text("Hello World")
                    .font(.title)
                Text("Yay")
                    .font(.title)
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            // approach 2 - extension (static factory method)
            VStack.greedyLeading {
                Text("Hello World")
                    .font(.title)
                Text("Yay")
                    .font(.title)
            }
            
            // approach 3 - struct
            GreedyTopVStack {
                Text("Hello World")
                    .font(.title)
                Text("Yay")
                    .font(.title)
            }
        }
    }
}

// approach 2
extension VStack {
    static func greedyLeading(spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) -> some View {
        VStack
            .init(alignment: .leading, spacing: spacing, content: content)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

// approach 3
struct GreedyTopVStack<Content: View>: View {
    private let spacing: CGFloat?
    private let content: () -> Content
    
    init(spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing, content: content)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
