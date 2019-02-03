//
//  TestInstruction.swift
//  SpineAlign
//
//  Created by Havi Nguyen on 2/2/19.
//  Copyright © 2019 Havi Nguyen. All rights reserved.
//

import UIKit

class TestInstruction: UIViewController {

    @IBOutlet weak var startScanButton: UIButton!
    
    @IBAction func startScanButton(_ sender: Any) {
        print("Start Scan Button is Pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
