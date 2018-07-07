//
//  LoginService.swift
//  InstaPost
//
//  Created by Admin on 05.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import WebKit

// MARK: Protocol
protocol InstagramLoginService {
    func instagramLogin(webview: WKWebView, completion: @escaping () -> Void)
}

// MARK: Implementation

private final class InstagramLoginServiceImpl: InstagramLoginService {
    
    let apiRequestManager: APIRequestManager
    
    
    init(apiRequestManager: APIRequestManager) {
        self.apiRequestManager = apiRequestManager
    }
    
    func instagramLogin(webview: WKWebView, completion: @escaping () -> Void) {
        apiRequestManager.login(webview: webview)
    }
}

// MARK: Factory

final class InstagramLoginServiceFactory {
    static func `default`(apiRequestManager: APIRequestManager = APIRequestManagerFactory.default()) -> InstagramLoginService {
        return InstagramLoginServiceImpl(apiRequestManager: apiRequestManager)
    }
}


