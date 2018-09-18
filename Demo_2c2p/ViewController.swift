//
//  ViewController.swift
//  Demo_2c2p
//
//  Created by Thitiwat Buatip on 13/9/2561 BE.
//  Copyright © 2561 Banana. All rights reserved.
//

import UIKit

class ViewController: UIViewController , my2c2pPaymentFormViewControllerSourceDelegate {

    let paymentSDK = My2c2pSDK(privateKey: config2c2p.privateKey)!
    let paymentFrom = my2c2pPaymentFormViewController.init(nibName: "CustomUIPaymentFormViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.paymentFrom.useCustomView = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func test_Action(_ sender: Any) {
        payment()
    }
    
    
    func payment() {
        
        //set mandatory fields
        
        paymentSDK.merchantID = "764764000000922"
        paymentSDK.uniqueTransactionCode = "1234567890"
        paymentSDK.desc = "Banana Software"
        paymentSDK.amount = 99.99
        paymentSDK.currencyCode = "764"
        paymentSDK.secretKey = "Scm3YfAvHxQ4"
        paymentSDK.paymentUI = true
        //paymentForm.useCustomView = true
        
        paymentSDK.request(withTarget: self, onResponse: { (response) in
            print("response: \(String(describing: response))")
            print("Debug")
        }) { (error) in
            if error != nil {
                print("error: \(String(describing: error?.localizedDescription))")
            } else {
                print("user cancel payment")
            }
        }
    }
}

