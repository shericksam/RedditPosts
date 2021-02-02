//
//  
//  HomeViewModel.swift
//  RedditPosts
//
//  Created by Erick Guerrero on 02/02/21.
//
//

import Foundation
import SwiftUI
import RetroSwift

class HomeViewModel: ObservableObject {
    // MARK: - variables
    let postRepository = PostRepository.shared
    @Published var isLoading: Bool = false
    @Published var posts: [PostChild] = []
    @Published var currentPost: PostChild? = nil
    @Published var showDialog: Bool = false
    
    func getPost() {
        self.isLoading = true
        Coroutines.io {
            do{
                let result = try self.postRepository.getPosts()
                print("result-->", result)
                Coroutines.main {
                    self.posts = result.data.children
                    self.isLoading = false
                }
            } catch let error as ErrorModel {
                print("error", error.localizedDescription)
                Coroutines.main {
                    self.isLoading = false
                }
            }
        }
    }
    
    func onTapPost(_ post: PostChild) {
        self.currentPost = post
        self.showDialog.toggle()
    }
}

