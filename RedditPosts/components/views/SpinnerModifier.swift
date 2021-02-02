//
//  SpinnerModifier.swift
//  RedditPosts
//
//  Created by Erick Guerrero on 02/02/21.
//  
//

import Foundation
import SwiftUI

struct SpinnerModifierBinding: ViewModifier {
    @Binding var isLoading: Bool
    
    @State var task: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(self.isLoading)
                .blur(radius: self.isLoading ? 1 : 0)
            
            if self.isLoading {
                ZStack {
                    ProgressView()
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 1.2))
            }
        }
    }
}
extension View {
    
    func spiner(_ isLoading: Binding<Bool>) -> some View {
        return self.modifier(SpinnerModifierBinding(isLoading: isLoading))
    }
}
