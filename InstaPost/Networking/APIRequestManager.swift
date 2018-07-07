//
//  APIRequestManager.swift
//  InstaPost
//
//  Created by Admin on 05.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import WebKit

// MARK: Protocol

protocol APIRequestManager {
    func login(webview: WKWebView)
}

// MARK: Implementation

private final class APIRequestManagerImpl: APIRequestManager {
    let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func login(webview: WKWebView) {
        let authUrl = API.login
        apiService.request(webview: webview, url: authUrl)
    }
}

// MARK: Factory

final class APIRequestManagerFactory {
    static func `default`(apiService: APIService = APIServiceFactory.default()) -> APIRequestManager {
        return APIRequestManagerImpl(apiService: apiService)
    }
}
