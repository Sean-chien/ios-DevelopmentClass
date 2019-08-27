//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Sean Chien on 2019-08-26.
//  Copyright © 2019 Sean Chien. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {
    @IBOutlet var label: UILabel!
    var eventNumber = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let existingText = label.text {
            label.text = "\(existingText)\n Event number \(eventNumber) was viewDidLoad"
            eventNumber += 1
            print("This is viewDidLoad")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let existingText = label.text {
            label.text = "\(existingText)\n Event number \(eventNumber) was viewWillAppear"
            eventNumber += 1
            print("This is viewWillAppear")
        }
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
