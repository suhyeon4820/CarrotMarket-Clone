//
//  PriceTableViewCell.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/25.
//

import UIKit

class PriceTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    static let identifier = "PriceTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PriceTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.delegate = self
        textField.placeholder = "| 가격 (선택사항)"
        textField.textColor = .gray
        textField.borderStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
