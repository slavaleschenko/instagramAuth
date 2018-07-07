//
//  WebViewRouter.swift
//  InstaPost
//
//  Created by Admin on 06.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol WebViewRouter {
    func routeToSearchController()
}

// MARK: - Implementation

private final class WebViewRouterImpl: NavigationRouter, WebViewRouter {
    func routeToSearchController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let searchController = storyBoard.instantiateViewController(withIdentifier: "searchController") as! SearchController
        let firstController = storyBoard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        firstController.present(searchController, animated: true, completion: nil)
    }
    
    
}

// MARK: - Factory

final class WebViewRouterFactory {
    static func `default`(
        navigationController: UINavigationController
        ) -> WebViewRouter {
        return WebViewRouterImpl(
            with: navigationController
        )
    }
}
