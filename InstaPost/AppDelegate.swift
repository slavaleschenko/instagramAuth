//
//  AppDelegate.swift
//  InstaPost
//
//  Created by Admin on 02.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

//    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
//        let absolute = url.absoluteString
//        let code = absolute.suffix(from: absolute.range(of: "code=")!.upperBound)
//        
//        guard let url = URL(string: "https://api.instagram.com/oauth/access_token?grant_type=authorization_code&client_id=8600a9c359234814baf67e4d4efab5aa&client_secret=8205a206187b4d918d00c205385493a6&code=\(code)") else {
//            print("URL is equal to nil")
//            return false
//        }
//        var request = URLRequest(url: url)
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        let postString = "code=\(code))"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print("error=\(String(describing: error))")
//                return
//            }
//            
//            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(String(describing: response))")
//            }
//            
//            //            let responseString = String(data: data, encoding: .utf8)
//            //            print("responseString = \(String(describing: responseString))")
//            do {
//                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any] else {
//                    print("problem in get token")
//                    return
//                }
//                let token = json["access_token"] as! String
//                UserDefaults.standard.set(token, forKey: "token")
////                DispatchQueue.main.async {
////                    NotificationCenter.default.post(name: .didFinishAuthorization, object: nil)
////                }
//            }
//        }
//        task.resume()
//        return true
//    }
    
}

