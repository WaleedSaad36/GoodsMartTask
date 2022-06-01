//
//  ArticleCell.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import UIKit

class ArticleCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    
    func configerCell(data:Article){
        self.title.text = data.title
        self.image.loadImage(With: data.urlToImage)
        self.descLbl.isHidden = true
        self.descLbl.removeConstraint(.init())
    }
    func configerCellMoreArtical(data:Article){
        self.title.text = data.title
        self.image.loadImage(With: data.urlToImage)
        self.descLbl.text = data.content
    }
    func setupUI(){
        image.layer.cornerRadius = 10
    }

}
