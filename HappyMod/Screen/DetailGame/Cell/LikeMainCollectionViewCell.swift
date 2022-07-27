//
//  LikeMainCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 08/07/2022.
//

import UIKit

class LikeMainCollectionViewCell: UICollectionViewCell {
    var data = 0
    @IBOutlet weak var lblTop: UILabel!
    @IBOutlet weak var lblSeeAll: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/1.4, height: 80)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "LikeCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LikeCellCollectionViewCell")
    }

}
extension LikeMainCollectionViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikeCellCollectionViewCell", for: indexPath)as! LikeCellCollectionViewCell
        
        return cell
    }
}
