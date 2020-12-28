//
//  HomeBarTableViewCell.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/28.
//

import UIKit

class HomeBarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var createTime: UILabel!
    @IBOutlet weak var priceText: UILabel!
    
    static let identifier = "HomeBarTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeBarTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func uploadData(_ model: SellList) {
        itemImage.layer.cornerRadius = 5
        titleText.text = model.title
        priceText.text = "\(model.price)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
