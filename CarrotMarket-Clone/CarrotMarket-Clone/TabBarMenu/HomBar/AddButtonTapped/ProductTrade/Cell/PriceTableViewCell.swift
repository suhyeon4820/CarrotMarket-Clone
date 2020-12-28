//
//  PriceTableViewCell.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/27.
//

import UIKit

class PriceTableViewCell: UITableViewCell, UITextFieldDelegate {
    
   
    @IBOutlet weak var field: UITextField!
    
    static let identifier = "PriceTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PriceTableViewCell", bundle: nil)
    }

    var data: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        field.delegate = self
        field.placeholder = "input"
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> String {
        data = "\(textField.text ?? "")"
       
        return data
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        data = "\(textField.text ?? "")"
        let intData = Int(data)
        DataManager.shared.priceCreateItem(price: intData ?? 0)
        //NotificationCenter.default.post(name: Notification.Name("updateTable"), object: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
