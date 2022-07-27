//
//  NewCollectionViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 06/07/2022.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {
    var data : Int = 0{
        didSet{
            self.collectionView.reloadData()
        }
    }
    weak var parent:UIViewController?
    @IBOutlet weak var lblTop: UILabel!
    @IBOutlet weak var lblSeeAll: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.width*1.6/2.5 - 40)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        lblSeeAll.isUserInteractionEnabled = true
        let touch = UITapGestureRecognizer(target: self, action: #selector(touchSeeAll))
        lblSeeAll.addGestureRecognizer(touch)
    }
    @objc func touchSeeAll(_ sender : UIGestureRecognizer){
        let vc = NewReleaseViewController()
        vc.titleViewController = lblTop.text!
        parent?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension NewCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailGameViewController()
        vc.data = Int.random(in: 0...5)
        parent?.navigationController?.pushViewController(vc, animated: true)
    }
}
