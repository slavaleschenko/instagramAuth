//
//  SearchController.swift
//  InstaPost
//
//  Created by Admin on 05.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    @IBOutlet weak var token: UILabel!
    
    var tokenID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.token.text = tokenID
        // Do any additional setup after loading the view.
    }

}
