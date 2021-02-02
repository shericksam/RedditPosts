//
//  HomeView.swift
//  RedditPosts
//
//  Created by Erick Guerrero on 02/02/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = .init()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    PostItemView(post: post)
                        .onTapGesture {
                            viewModel.onTapPost(post)
                        }
                }
            }
                .navigationTitle("Posts")
                .onAppear(perform: viewModel.getPost)
        }
        .alert(isPresented: $viewModel.showDialog, content: { () -> Alert in
            Alert(
                title: Text(viewModel.currentPost?.data.authorFullname ?? "no author"),
                message: Text(viewModel.currentPost?.data.selftext ?? "no selected"),
                dismissButton: .cancel(Text("ok"))
            )
        })
        .spiner($viewModel.isLoading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
