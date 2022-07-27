//
//  Extension+Color.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 06/07/2022.
//

import UIKit

extension UIColor{
    static var bgGreen1: UIColor = UIColor(red: 0.956, green: 0.975, blue: 0.959, alpha: 1)
    static var bgSearch : UIColor = UIColor(red: 0.783, green: 0.783, blue: 0.783, alpha: 1)
    static var titleColor : UIColor = UIColor(red: 0.533, green: 0.584, blue: 0.549, alpha: 1)
    static var btSeeAllColor: UIColor = UIColor(red: 0.353, green: 0.796, blue: 0.004, alpha: 1)
    static var boldGreentext: UIColor = UIColor(red: 0.118, green: 0.624, blue: 0.004, alpha: 1)
}

extension UICollectionView{
    func configCollectionView(minimumLineSpacing: CGFloat,scrollDirection: UICollectionView.ScrollDirection,cgSize: CGSize){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = minimumLineSpacing
        layout.scrollDirection = scrollDirection
        layout.itemSize = cgSize
        self.backgroundView?.backgroundColor = .clear
        self.backgroundColor = .clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.collectionViewLayout = layout
    }
    
    func configCollectionView2(minimumLineSpacing: CGFloat,scrollDirection: UICollectionView.ScrollDirection){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = minimumLineSpacing
        layout.scrollDirection = scrollDirection
        self.backgroundView?.backgroundColor = .clear
        self.backgroundColor = .clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.collectionViewLayout = layout
    }
}
extension UIViewController{
    func createdTitleNaviGation(title: String,colorTitle: UIColor, fontSize: CGFloat){
        let titleView = UILabel()
        titleView.boldFont(sizeFont: fontSize, color: colorTitle, title: title)
        navigationItem.titleView = titleView
    }
}

extension UILabel{
    func regularFont(sizeFont : CGFloat, color: UIColor,title: String){
        self.font = UIFont(name: "Roboto-Regular", size: sizeFont)
        self.text = title
        self.textColor = color
    }
    func boldFont(sizeFont : CGFloat, color: UIColor,title: String){
        self.text = title
        self.font = UIFont(name: "Roboto-Bold", size: sizeFont)
        self.textColor = color
    }
    func mediumFont(sizeFont : CGFloat, color: UIColor,title: String){
        self.text = title
        self.font = UIFont(name: "Roboto-Medium", size: sizeFont)
        self.textColor = color
    }
}
extension UIImageView{
    func setImg(url: String){
        let url = URL(string: API.BASE_URL + url)
        self.kf.setImage(with: url)
    }
}

