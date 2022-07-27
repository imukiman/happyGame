//
//  NewReleasesMainTableViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 09/07/2022.
//

import UIKit

class NewReleasesMainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTop: UILabel!
    @IBOutlet weak var lblSeeAll: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data : [DataItemCategories] = []
    var pageGame: PageGame = .dicCover
    weak var parent:UIViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none

        lblSeeAll.isUserInteractionEnabled = true
        lblSeeAll.regularFont(sizeFont: 14, color: .btSeeAllColor, title: "See all")
        let touch = UITapGestureRecognizer(target: self, action: #selector(touchSeeAll))
        lblSeeAll.addGestureRecognizer(touch)
        configCollectionView()
    }
    
    func bindData(data: [DataItemCategories], title: String, parent: UIViewController, pageGame: PageGame){
        self.data = data
        self.pageGame = pageGame
        lblTop.boldFont(sizeFont: 20, color: .gray, title: title)
        self.parent = parent
        self.collectionView.reloadData()
    }
    
    func configCollectionView(){
        collectionView.configCollectionView(minimumLineSpacing: 20, scrollDirection: .horizontal, cgSize: CGSize(width: 140, height: 220))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
    }
    
    @objc func touchSeeAll(_ sender : UIGestureRecognizer){
        let vc = NewReleaseViewController()
        vc.titleViewController = lblTop.text!
        vc.pageGame = self.pageGame
        parent?.navigationController?.pushViewController(vc, animated: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension NewReleasesMainTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        cell.bindData(data: data[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailGameViewController()
        vc.data = data[indexPath.row]
        parent?.navigationController?.pushViewController(vc, animated: true)
    }
}
