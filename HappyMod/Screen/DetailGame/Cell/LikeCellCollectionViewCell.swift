//
//  LikeCellCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 08/07/2022.
//

import UIKit

class LikeCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var btAdd: UIButton!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 8
        container.clipsToBounds = true
        container.layer.cornerRadius = 10
        btAdd.layer.cornerRadius = 12
        
    }

    @IBAction func btAdd(_ sender: Any) {
        print("Added")
    }
}
