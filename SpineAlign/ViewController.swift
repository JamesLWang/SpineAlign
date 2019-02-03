//
//  ViewController.swift
//  SpineAlign
//
//  Created by Havi Nguyen on 2/2/19.
//  Copyright © 2019 Havi Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    
    @IBAction func testButton(_ sender: Any) {
        print("Test Button is Pressed")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(OpenCVWrapper.openCVVersionString())")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

