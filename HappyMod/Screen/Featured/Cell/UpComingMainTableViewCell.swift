//
//  UpComingMainTableViewCell.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 09/07/2022.
//

import UIKit

class UpComingMainTableViewCell: UITableViewCell {
   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTop: UILabel!
    
    var data : [DataItemCategories] = []
    weak var parent : UIViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
        configCollectionView()
    }
    
    func bindData(data: [DataItemCategories], parent: UIViewController){
        self.parent = parent
        self.data = data
        self.collectionView.reloadData()
    }
    
    func configCollectionView(){
        collectionView.configCollectionView(minimumLineSpacing: 15, scrollDirection: .horizontal, cgSize: CGSize(width: 250, height: 180))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "itemUpCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemUpCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

extension UpComingMainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemUpCollectionViewCell", for: indexPath) as! itemUpCollectionViewCell
        cell.lblName.text = data[indexPath.row].name!
        cell.lblDate.text = data[indexPath.row].released!
        cell.imgView.setImg(url: data[indexPath.row].backgroundImage!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailGameViewController()
//        vc.bindData(data: data[indexPath.row])
        vc.data = data[indexPath.row]
        parent?.navigationController?.pushViewController(vc, animated: true)
    }
}
