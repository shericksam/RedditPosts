//
//  
//  OnLoadModifier.swift
//  RedditPosts
//
//  Created by Erick Guerrero on 02/02/21.
//  
//
//

import Foundation
import SwiftUI

struct OnLoadModifier: ViewModifier {
    
    // MARK: - variables
    @State var didAppear = false
    var work : () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear(perform: onLoad)
    }
    
    func onLoad() {
        if !didAppear {
            work()
        }
        didAppear = true
    }
}
