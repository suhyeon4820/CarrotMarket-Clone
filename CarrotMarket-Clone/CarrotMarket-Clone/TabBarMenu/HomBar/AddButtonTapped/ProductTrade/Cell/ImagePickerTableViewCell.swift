//
//  ImagePickerTableViewCell.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/25.
//

import UIKit

class ImagePickerTableViewCell: UITableViewCell {

    static let identifier = "ImagePickerTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ImagePickerTableViewCell", bundle: nil)
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
