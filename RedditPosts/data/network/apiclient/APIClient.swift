//
//  APIClient.swift
//  RedditPosts
//
//  Created by Erick Guerrero on 02/02/21.
//
//

import Foundation
import RetroSwift

class APIClient {
    static var shared = APIClient()
    let baseUrl: String = AppConstants.finalURL
    
    var caller: RequestCaller =  {
        let config = URLSessionConfiguration.default
        if #available(iOS 11.0, *) {
            config.waitsForConnectivity = true
        }
        config.allowsConstrainedNetworkAccess = true
        config.urlCredentialStorage = .shared
        return RequestCaller(config: config)
    }()
    
    //    -------------------Posts----------------------------
    func getPosts() -> Result<RedditPostResponse, ErrorModel> {
        let request = RequestModel(
            httpMethod: .get,
            path: "androiddev.json",
            baseUrl: self.baseUrl,
            contentType: .ApplicationJson
        )
        .asURLRequest()
        
        return self.caller.call(request)
    }
}
