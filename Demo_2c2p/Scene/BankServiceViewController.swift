//
//  BankServiceViewController.swift
//  Demo_2c2p
//
//  Created by Thitiwat Buatip on 17/9/2561 BE.
//  Copyright © 2561 Banana. All rights reserved.
//

import UIKit

class BankServiceViewController: UIViewController {

    let paymentOption = ["BAY","BBL","KBANK","KTB","SCB","TBANK","TMB","UOB"]
    
    let pickerOtion = ["ATM Machine","Bank Counter","Internet Banking","Web Payment"]
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var telTxt: UITextField!
    @IBOutlet weak var payOptionTxt: UITextField!
    @IBOutlet weak var banknameLabel: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        payOptionTxt.inputView = pickerView
        
        payOptionTxt.delegate = self
        
        confirmBtn.layer.cornerRadius = 6
        
        
        
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - CollectionView Function

extension BankServiceViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paymentOption.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BankServiceCollectionViewCell", for: indexPath)as! PaymentSelectCollectionViewCell
        cell.iconImage.image = UIImage(named: paymentOption[indexPath.row])
        cell.backGroudView.layer.cornerRadius = 6
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        banknameLabel.text = paymentOption[indexPath.row]
    }
}

// MARK: - PickerView Funtion

extension BankServiceViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOtion.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOtion[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        payOptionTxt.text = pickerOtion[row]
    }
}

// MARK: - Textfield Disable Edit

extension BankServiceViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
