//
//  TopGameMainTableViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 10/07/2022.
//

import UIKit
import Cosmos
class TopGameMainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackRating: UIStackView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = .white
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(data: DataItemCategories,number: Int){
        lblName.boldFont(sizeFont: 20, color: .black, title: "")
        lblDate.regularFont(sizeFont: 14, color: .gray, title: "")
        rating.rating = Double(data.rating!) ?? 0
        lblNumber.text = "\(number)"
        lblName.text = data.name!
        lblDate.text = data.released!
        imgView.setImg(url: data.backgroundImage ?? "")
    }
    
    func bindData2(data: ItemReal,number: Int){
        lblName.boldFont(sizeFont: 20, color: .black, title: "")
        lblDate.regularFont(sizeFont: 14, color: .gray, title: "")
        rating.rating = Double(data.rating) ?? 0
        lblNumber.text = "\(number)"
        lblName.text = data.name
        lblDate.text = data.released
        imgView.setImg(url: data.backgroundImage ?? "")
    }
     
}
