//
//  ViewController.swift
//  TestApp
//
//  Created by Suraj on 07/10/20.
//  Copyright © 2020 Suraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("add log")
        print("12334444444 12334444444 123344444441233444444412334444444 1233444444412334444444123344444441233444444412334444444 1233444444412334444444123344444441233444444412334444444")
        
        self.displayText(text: "danhger-swift", times: 5)
        
        self.displayText(text: "danhger-swift3546", times: 5)
        print("code merged & jenkins file changed")
        print("code mer++++" );

    }

    func displayText(text: String,times: Int)  {
        print("\(text)")
    }
}

