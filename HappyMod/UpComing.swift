//
//  UpComing.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 06/07/2022.
//

import UIKit

class UpComing: UIView{
    var viewLbl = UIView()
    var lblTitle = UILabel()
    var lblSeeAll = UILabel()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUi(){
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = .clear
        
        viewLbl.addSubview(lblSeeAll)
        lblSeeAll.text = "See all"
        lblSeeAll.textColor = .btSeeAllColor
        lblSeeAll.translatesAutoresizingMaskIntoConstraints = false
        lblSeeAll.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        lblSeeAll.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
        viewLbl.addSubview(lblTitle)
        lblTitle.text = "New Releases"
        lblTitle.textColor = .titleColor
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.leadingAnchor.constraint(equalTo: viewLbl.leadingAnchor, constant: 0).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: viewLbl.bottomAnchor, constant: 0).isActive = true
        
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        
    
    }
    func setUpDatasourceandDelegatr(d1: UICollectionViewDelegate & UICollectionViewDataSource){
        collectionView.dataSource = d1
        collectionView.delegate = d1
    }
}
