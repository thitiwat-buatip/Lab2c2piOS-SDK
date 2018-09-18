//
//  PaymentViewController.swift
//  Demo_2c2p
//
//  Created by Thitiwat Buatip on 14/9/2561 BE.
//  Copyright © 2561 Banana. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    let paymentOption = ["ชำระผ่านเคาน์เตอร์ชำระเงิน", "ชำระเงินผ่านธนาคาร"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - TableViewController

extension PaymentViewController : UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return paymentOption.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventDetailTableViewCell")as! EventDetailTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RunnerDetailTableViewCell")as! RunnerDetailTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalPayTableViewCell")as! TotalPayTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentOptionTableViewCell")as! PaymentOptionTableViewCell
            cell.paymentLabel.text = paymentOption[indexPath.row]
            cell.iconImage.image = UIImage(named: paymentOption[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 300
        case 1:
            return 100
        case 2:
            return 80
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            switch indexPath.row {
            case 0:
                let counterView = UIStoryboard.init(name: "CounterService", bundle: nil).instantiateViewController(withIdentifier: "CounterServiceViewController")as! CounterServiceViewController
                self.navigationController?.pushViewController(counterView, animated: true)
            case 1:
                let counterView = UIStoryboard.init(name: "BankChannels", bundle: nil).instantiateViewController(withIdentifier: "BankServiceViewController")as! BankServiceViewController
                self.navigationController?.pushViewController(counterView, animated: true)
            default:
                break
            }
        }
    }
}
