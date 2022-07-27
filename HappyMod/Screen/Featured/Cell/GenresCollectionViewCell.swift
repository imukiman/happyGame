//
//  GenresCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 06/07/2022.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    weak var parent : UIViewController?
    var data : Int = 0{
        didSet{
            self.collectionView.reloadData()
        }
    }
    @IBOutlet weak var lblSeeAll: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.width*1.3/2.5 - 40)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ItemGenresCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemGenresCollectionViewCell")
        
        lblSeeAll.isUserInteractionEnabled = true
        let touch = UITapGestureRecognizer(target: self, action: #selector(touchSeeAll))
        lblSeeAll.addGestureRecognizer(touch)
    }
    
    @objc func touchSeeAll(_ sender : UIGestureRecognizer){
        let vc = GenresViewController()
        vc.dataA = self.data
        vc.titleViewController = "Genres"
        parent?.navigationController?.pushViewController(vc, animated: true)
    }

}
extension GenresCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemGenresCollectionViewCell", for: indexPath) as! ItemGenresCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailGameViewController()
        vc.data = Int.random(in: 0...5)
        parent?.navigationController?.pushViewController(vc, animated: true)
    }
}
