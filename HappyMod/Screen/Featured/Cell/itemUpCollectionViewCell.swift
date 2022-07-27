//
//  itemUpCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 06/07/2022.
//

import UIKit

class itemUpCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblName.boldFont(sizeFont: 18, color: .white, title: "")
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
    }
    
    func bindData(){
       
    }

}
