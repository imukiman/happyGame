//
//  PreviewMainCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 08/07/2022.
//

import UIKit

class PreviewMainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTop: UILabel!
    
    var data : [String] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    weak var parent : UIViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.width*1.4/2.5 - 40)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PreviewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PreviewCollectionViewCell")
    }

}
extension PreviewMainCollectionViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
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
