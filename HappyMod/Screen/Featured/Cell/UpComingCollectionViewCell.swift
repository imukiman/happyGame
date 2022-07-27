//
//  UpComingCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 06/07/2022.
//

import UIKit

class UpComingCollectionViewCell: UICollectionViewCell {
    var data : Int = 0{
        didSet{
            self.collectionView.reloadData()
        }
    }
    weak var parent : UIViewController?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTop: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.width*1.4/2.5 - 40)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "itemUpCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemUpCollectionViewCell")
    }

}
extension UpComingCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemUpCollectionViewCell", for: indexPath) as! itemUpCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailGameViewController()
        vc.data = Int.random(in: 0...5)
        parent?.navigationController?.pushViewController(vc, animated: true)
    }
}
