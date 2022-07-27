//
//  GenresChildCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 08/07/2022.
//

import UIKit

class GenresChildCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(text: String, isSelect: Bool) {
        if isSelect {
            lblName.boldFont(sizeFont: 17, color: .boldGreentext, title: text)
        } else {
            lblName.mediumFont(sizeFont: 17, color: .gray, title: text)
        }
    
    }

}
