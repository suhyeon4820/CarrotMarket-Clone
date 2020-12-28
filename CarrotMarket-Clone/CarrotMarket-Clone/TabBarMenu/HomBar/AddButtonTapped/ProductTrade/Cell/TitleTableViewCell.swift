//
//  TitleTableViewCell.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/28.
//

import UIKit

class TitleTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    
    static let identifier = "TitleTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TitleTableViewCell", bundle: nil)
    }

    var data: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleTextField.delegate = self
        print(data, "data")
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        data = "\(textField.text ?? "")"
        DataManager.shared.titleCreateItem(title: data)
        //NotificationCenter.default.post(name: Notification.Name("updateTable"), object: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        data = "\(textField.text ?? "")"
        print(data)
        return true
    }
   
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ProductTradeViewController = segue.destination as! ProductTradeViewController
        let cookie = "cookie"
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
