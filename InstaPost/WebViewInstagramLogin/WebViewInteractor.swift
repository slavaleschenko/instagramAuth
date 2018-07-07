//
//  WebViewInteractor.swift
//  InstaPost
//
//  Created by Admin on 06.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import WebKit

// MARK: - Output

protocol WebViewInteractorOutput: class {
    func didInstagramLogin()
}

// MARK: - Protocol

protocol WebViewInteractor: class {
    var output: WebViewInteractorOutput? { get set }
    func login(webview: WKWebView)
}

// MARK: - Implementation

private final class WebViewInteractorImpl: WebViewInteractor {
    
    
    weak var output: WebViewInteractorOutput?
    
    private let loginService: InstagramLoginService
    
    init(loginService: InstagramLoginService) {
        self.loginService = loginService
    }
    
    func login(webview: WKWebView) {
        loginService.instagramLogin(webview: webview) { [weak self] in
            self?.output?.didInstagramLogin()
        }
       
    }
    
   
}

// MARK: - Factory

final class WebViewInteractorFactory {
    static func `default`(loginService: InstagramLoginService = InstagramLoginServiceFactory.default()) -> WebViewInteractor {
        return WebViewInteractorImpl(loginService: loginService)
    }
}
