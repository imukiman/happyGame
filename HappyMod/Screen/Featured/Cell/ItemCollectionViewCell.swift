//
//  ItemCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 06/07/2022.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var data: DataItemCategories?
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        containerView.layer.cornerRadius = 12
        imgView.layer.cornerRadius = 8
        imgView.clipsToBounds = true
    }
    func bindData(data: DataItemCategories){
        imgView.setImg(url: data.backgroundImage!)
        lblName.mediumFont(sizeFont: 14, color: .black, title: data.name!)
        lblDate.regularFont(sizeFont: 12, color: .lightGray, title: data.released!)
    }
    
}
