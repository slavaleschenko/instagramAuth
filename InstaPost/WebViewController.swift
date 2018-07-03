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


class WebViewController: UIViewController, WKUIDelegate {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        let auth = InstagramEngine.shared().authorizationURL()
        self.webView.load(URLRequest(url: auth))

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: WebView Delegate
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: ((WKNavigationActionPolicy) -> Void)) {

        var error:NSError?
        if InstagramEngine.shared().receivedValidAccessToken(from: navigationAction.request.url!, error: &error) {
            let accessToken = InstagramEngine.shared().accessToken
            print("accessToken: \(String(describing: accessToken))")
        } else {
            print("Error: \(String(describing: error?.localizedDescription))")
        }
    }
    
}
