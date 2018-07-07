//
//  NavigationRouter.swift
//  InstaPost
//
//  Created by Admin on 06.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation

import UIKit

class NavigationRouter: NSObject {
    
    let navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
