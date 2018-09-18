//
//  CounterServiceViewController.swift
//  Demo_2c2p
//
//  Created by Thitiwat Buatip on 14/9/2561 BE.
//  Copyright © 2561 Banana. All rights reserved.
//

import UIKit

class CounterServiceViewController: UIViewController {
    
    let agentCodes = ["TESCO","BIGC","PAYATPOST","TRUEMONEY","CENPAY","MPAY"]
    let channelCode = "OVERTHECOUNTER"

    let paymentSDK = My2c2pSDK.init(privateKey: config2c2p.privateKey)!
    
    @IBOutlet weak var counterNameLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var telTxt: UITextField!
    
    @IBOutlet weak var confrimBtn: UIButton!
    
    var agentCode = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        confrimBtn.layer.cornerRadius = 6

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func RAND_FROM_TO(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32((max - min)+1)))
    }
    
    func randomUniqueTransactionCode() -> String? {
        return "\("\(Int(roundf(Float(Date().timeIntervalSince1970))))")\(RAND_FROM_TO(min: 0, max: 9))"
    }

    @IBAction func confrimAction(_ sender: Any) {
        if nameTxt.text != "" && emailTxt.text != "" && telTxt.text != "" {
            payment(agenCode: agentCode)
        }
    }
    
    // MARK: - Navigation

    func payment(agenCode : String) {
        
        //set mandatory fields
        paymentSDK.merchantID = "764764000000922"
        paymentSDK.uniqueTransactionCode = randomUniqueTransactionCode()
        paymentSDK.desc = "BananaSoftware item 1"
        paymentSDK.amount = 10.00
        paymentSDK.currencyCode = "764"
        paymentSDK.cardHolderName = "Thitiwat Buatip"
        paymentSDK.cardHolderEmail = "subin2538@gmail.com"
        paymentSDK.secretKey = "Scm3YfAvHxQ4"
        paymentSDK.paymentUI = false
        
        //set 123 mandatory fields
        paymentSDK.paymentChannel = ONE_TWO_THREE
        paymentSDK.agentCode = agenCode
        paymentSDK.channelCode = channelCode
        
        //set 123 optionals fields
        paymentSDK.paymentExpiry = ""
        paymentSDK.mobileNo = ""
        
        paymentSDK.request(withTarget: self, onResponse: { (response) in
            print("response: \(String(describing: response))")
        }) { (error) in
            if error != nil {
                print("error: \(String(describing: error?.localizedDescription))")
            }else{
                print("user cancel payment")
            }
        }
    }
}

extension CounterServiceViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return agentCodes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CouterServiceCollectionViewCell", for: indexPath)as! PaymentSelectCollectionViewCell
        cell.iconImage.image = UIImage(named: agentCodes[indexPath.row])
        cell.backGroudView.layer.cornerRadius = 6
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        agentCode = agentCodes[indexPath.row]
        counterNameLabel.text = agentCode
    }
}
