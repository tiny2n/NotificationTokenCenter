//
//  ViewController.swift
//  NotificationTokenCenter-Demo
//
//  Created by Choi Joongkwan on 2017. 8. 21..
//  Copyright © 2017년 tiny2n. All rights reserved.
//

import UIKit

public let ViewControllerNotification = Notification.Name("ViewControllerNotification")

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onRegister(_ sender: Any) {
        NotificationTokenCenter.default.addObserver(for: self, name: ViewControllerNotification) { (wrapper: NotificationWrapper<Int>) in
            let object = wrapper.object ?? 0
            print(object)
        }
    }
    
    @IBAction func onUnregister(_ sender: Any) {
        NotificationTokenCenter.default.removeObserver(for: self)
    }
    
    @IBAction func onPost(_ sender: Any) {
        NotificationCenter.default.post(name: ViewControllerNotification, object: 1)
    }
}

