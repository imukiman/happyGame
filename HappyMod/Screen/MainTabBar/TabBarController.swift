//
//  TabBarController.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 07/07/2022.
//

import UIKit

class TabBarController : UITabBarController{
    let featured = UINavigationController(rootViewController: FeaturedController())
    let topGame = UINavigationController(rootViewController: TopGameController())
    let mygame = UINavigationController(rootViewController: MyGameController())
    let setting = UINavigationController(rootViewController:SettingController())
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbarItem()
       
    }
    
    func configTabbarItem(){
        featured.title = "Featured"
        topGame.title = "Top Game"
        mygame.title = "My Game"
        setting.title = "Setting"
        featured.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 13) as Any
        ], for: .normal)
        topGame.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 13) as Any
        ], for: .normal)
        mygame.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 13) as Any
        ], for: .normal)
        setting.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 13) as Any
        ], for: .normal)
        self.setViewControllers([featured,topGame,mygame,setting], animated: false)
        
        guard let item = self.tabBar.items else{
            return
        }
        let images = ["featured","topgame","mygame","setting"]
        for i in 0..<images.count{
            item[i].image = UIImage(named: images[i])?.withRenderingMode(.alwaysOriginal)
        }
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .boldGreentext
        self.tabBar.unselectedItemTintColor = .lightGray
    }
 
}
