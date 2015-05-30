//
//  ViewController.swift
//  iShots
//
//  Created by Lala Vaishno De on 5/29/15.
//  Copyright (c) 2015 Casa Wee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let api = DribbbleAPI()
        api.loadShots(nil)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

