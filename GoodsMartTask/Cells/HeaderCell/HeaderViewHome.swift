//
//  HeaderViewHome.swift
//  Cone
//
//  Created by mohamed eltabey on 1/18/22.

import UIKit

class HeaderViewHome: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var MoreBtn: UIButton!
    
    
    var title :String? {
        didSet{
            titleLabel.text = title
        }
    }
    
    var titleButton:String? {
        didSet{
            MoreBtn.adjustButton(text: titleButton ?? "", textColor: .orange , fontSize: 15)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
