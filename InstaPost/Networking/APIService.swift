//
//  APIService.swift
//  InstaPost
//
//  Created by Admin on 05.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import WebKit

// MARK: Protocol
protocol APIService {
    func request(webview: WKWebView, url: TargetType)
}

// MARK: Implementation
private final class APIServiceImpl: APIService {
    func request(webview: WKWebView, url: TargetType) {
        let loginUrl = url.loginUrl
        webview.load(URLRequest(url: loginUrl, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData))
    }
}

// MARK: Factory
class APIServiceFactory {
    static func `default`() -> APIService {
        return APIServiceImpl()
    }
}
