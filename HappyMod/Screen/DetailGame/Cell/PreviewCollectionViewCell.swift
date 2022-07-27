//
//  PreviewCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 08/07/2022.
//

import UIKit

class PreviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 20
    }

}
