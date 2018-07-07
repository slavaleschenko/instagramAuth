//
//  API.swift
//  InstaPost
//
//  Created by Admin on 02.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation

enum API {
    case login
    case search(token: String)
}

extension API: TargetType {
    var loginUrl: URL {
        switch self {
        case .login:
            let baseUrl = "https://api.instagram.com/oauth/authorize/"
            let clientID = "8600a9c359234814baf67e4d4efab5aa"
            let redirectURI = "http://localhost"
            let responseType = "token"
            var url = URLComponents(string: baseUrl)
            url?.queryItems = [
                URLQueryItem(name: "client_id", value: clientID),
                URLQueryItem(name: "redirect_uri", value: redirectURI),
                URLQueryItem(name: "response_type", value: responseType),
            ]
            return url!.url!
        case .search(let token):
            let baseUrl = "https://api.instagram.com/oauth/authorize/"
            return (URLComponents(string: baseUrl)?.url)!
        }
    }
}
