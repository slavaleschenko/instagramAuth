//
//  WebViewController.swift
//  InstaPost
//
//  Created by Admin on 02.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import UIKit
import WebKit
import InstagramKit


class WebViewController: UIViewController, WebViewPresenterOutput, WKNavigationDelegate {
    
    fileprivate let presenter: WebViewPresenter
    @IBOutlet weak var webView: WKWebView!
    
    init(presenter: WebViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        presenter.handleViewIsReady(webview: webView)
    }
    
    func didFinishInstagramLogin() {
        presenter.pushToSearchController()
    }
    
    //MARK: WebView Delegate
   
    public func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let url = navigationAction.request.url?.absoluteString, let _ = url.range(of: "#access_token=") {
            let token = url.suffix(from: url.range(of: "access_token=")!.upperBound)
            UserDefaults.standard.set(token, forKey: "token")
            print(token)
        }
        decisionHandler(.allow)
    }
}



// MARK: - Factory

final class WebViewControllerFactory {
    static func new(
        presenter: WebViewPresenter
        ) -> WebViewController {
        let controller = WebViewController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}




