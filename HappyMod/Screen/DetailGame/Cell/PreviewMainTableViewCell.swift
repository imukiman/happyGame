//
//  PreviewMainTableViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 12/07/2022.
//

import UIKit

class PreviewMainTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTop: UILabel!
    
    var data : [String] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
        lblTop.boldFont(sizeFont: 20, color: .gray, title: "Preview")
        collectionView.configCollectionView(minimumLineSpacing: 10, scrollDirection: .horizontal, cgSize: CGSize(width: 240, height: 200))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PreviewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PreviewCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension PreviewMainTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewCollectionViewCell", for: indexPath)as! PreviewCollectionViewCell
        let url = URL(string: API.BASE_URL+data[indexPath.row])
        cell.imgView.kf.setImage(with: url)
        return cell
    }
}
