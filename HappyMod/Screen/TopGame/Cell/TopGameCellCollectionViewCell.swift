//
//  TopGameCellCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 07/07/2022.
//

import UIKit

class TopGameCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var imgStar: [UIImageView]!
    @IBOutlet weak var stackRating: UIStackView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 15
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 12
        imgView.backgroundColor = .black
        
        // Initialization code
    }
    func bindData(rating: Int){
        changeRating(rating: rating)
    }
    
    func changeRating(rating: Int){
        for i in 0..<imgStar.count{
            if i < rating{
                imgStar[i].image = UIImage(named: "starfill")
            }
            else{
                imgStar[i].image = UIImage(named: "star")
            }
        }
    }

}
