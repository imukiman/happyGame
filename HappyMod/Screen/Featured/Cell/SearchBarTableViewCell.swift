//
//  SearchBarTableViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 10/07/2022.
//

import UIKit

class SearchBarTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
