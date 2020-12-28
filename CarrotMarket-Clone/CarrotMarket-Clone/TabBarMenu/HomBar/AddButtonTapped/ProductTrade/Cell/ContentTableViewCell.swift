//
//  ContentTableViewCell.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/27.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    
    static let identifier = "ContentTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ContentTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        textView.text = "올릴 게시글 내용을 작성해주세요.\n" + "가품 및 판매금지품목은 게시가 제한될 수 있어요."

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
