//
//  WebViewPresenter.swift
//  InstaPost
//
//  Created by Admin on 06.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import WebKit

// MARK: - Output

protocol WebViewPresenterOutput: class {
    func didFinishInstagramLogin()
}

// MARK: - Protocol

protocol WebViewPresenter: class {
    var output: WebViewPresenterOutput? { get set }
    
    func handleViewIsReady(webview: WKWebView)
    func pushToSearchController()
}

// MARK: - Implementation

private final class WebViewPresenterImpl: WebViewPresenter, WebViewInteractorOutput {
   
    private let interactor: WebViewInteractor
    private let router: WebViewRouter
    weak var output: WebViewPresenterOutput?
    
    init(
        interactor: WebViewInteractor,
        router: WebViewRouter
        ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady(webview: WKWebView) {
        interactor.login(webview: webview)
    }
    
    func didInstagramLogin() {
        DispatchQueue.main.async {
            self.output?.didFinishInstagramLogin()
        }
    }
    
    func pushToSearchController() {
        router.routeToSearchController()
    }
}

// MARK: - Factory

final class WebViewPresenterFactory {
    static func `default`(
        interactor: WebViewInteractor = WebViewInteractorFactory.default(),
        router: WebViewRouter
        ) -> WebViewPresenter {
        let presenter = WebViewPresenterImpl(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        return presenter
    }
}
