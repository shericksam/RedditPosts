//
//  AppGlobals.swift
//
//  Created by Erick Guerrero on 02/02/21.
//

import UIKit

enum AppConstants {
    static let enviroment : NetworkEnvironment = .qa
    static let prodUrl = "https://www.reddit.com/r"
    static let testUrl = "https://www.reddit.com/r"
    static var finalURL: String {
        switch AppConstants.enviroment {
            case .production: return prodUrl
            case .qa: return testUrl
            case .dev: return testUrl
            case .dev_b: return testUrl
        }
    }
}

public enum NetworkEnvironment {
    case qa
    case production
    case dev
    case dev_b
}
