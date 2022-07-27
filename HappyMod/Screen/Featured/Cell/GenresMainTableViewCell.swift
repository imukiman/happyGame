//
//  GenresMainTableViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 09/07/2022.
//

import UIKit

class GenresMainTableViewCell: UITableViewCell {
   
    @IBOutlet weak var lblTop: UILabel!
    @IBOutlet weak var lblSeeAll: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var parent : UIViewController?
    var data: [CategoriesData] = []
    
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
    func configCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: 140,height: 160)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ItemGenresCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemGenresCollectionViewCell")
    }
    
    func bindData(data: [CategoriesData], title: String, parent: UIViewController){
        self.data = data
        lblTop.boldFont(sizeFont: 20, color: .gray, title: title)
        self.parent = parent
        self.collectionView.reloadData()
    }

    @objc func touchSeeAll(_ sender : UIGestureRecognizer){
        let vc = GenresViewController()
        vc.arrGenres = data
        parent?.navigationController?.pushViewController(vc, animated: true)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension GenresMainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemGenresCollectionViewCell", for: indexPath) as! ItemGenresCollectionViewCell
        cell.bindData(data : data[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = NewReleaseViewController()
        vc.titleViewController = data[indexPath.row].name!
        vc.pageGame = .genRes
        parent?.navigationController?.pushViewController(vc, animated: true)
    }
}
