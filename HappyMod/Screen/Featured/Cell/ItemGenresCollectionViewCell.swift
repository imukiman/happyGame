//
//  ItemGenresCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 06/07/2022.
//

import UIKit
import Kingfisher
class ItemGenresCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView.layer.cornerRadius = 16
        imgView.clipsToBounds = true
    }
    func bindData(data: CategoriesData){
        let url = URL(string: API.BASE_URL + (data.imageBackground ?? ""))
        lblName.mediumFont(sizeFont: 16, color: .black, title: data.name ?? "")
        imgView.setImg(url: data.imageBackground ?? "")
    }
}
