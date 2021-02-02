//
//  
//  PostItemView.swift
//  RedditPosts
//
//  Created by Erick Guerrero on 02/02/21.
//
//

import SwiftUI

struct PostItemView: View {
    
    // MARK: - Propertiers
    var post: PostChild
    
    // MARK: - View
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.purple)
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("Title:")
                        .bold()
                    Text(post.data.title)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                
                HStack(alignment: .top) {
                    Text("Author:")
                        .bold()
                    Text(post.data.authorFullname)
                    Spacer()
                }
            }
        }
    }
    
    // MARK: - funcs
}
