//
//  AddViewController.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 08/07/2022.
//

import UIKit
protocol DelegateView{
    func changeDelegate(title: String)
}
class AddViewController: UIViewController {
    @IBOutlet weak var container: UIView!
    @IBOutlet var bt_Top_Collection: [UIButton]!
    
    var currentButton = 0
    var delegate : DelegateView?
    var data: DataItemCategories?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        container.clipsToBounds = true
        container.layer.cornerRadius = 25
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }


    @IBAction func btAddCollection(_ sender: UIButton) {
        switch sender.tag{
        case 0: savedata(.wanted)
        case 1: savedata(.playing)
        case 2: savedata(.played)
        default:
            return
        }
//        guard let title = sender.titleLabel?.text else{
//            return
//        }
//        delegate?.changeDelegate(title: title)
//        dismiss(animated: false)
    }
    
    func savedata(_ play : Play){
        guard let data = data else{
            return
        }
        let item = ItemReal()
        item.id = data.id!
        item.play = play.rawValue
        item.name = data.name!
        item.backgroundImage = data.backgroundImage!
        item.genres = data.genres!
        item.rating = data.rating!
        item.released = data.released!
        item.shortScreenshots = data.shortScreenshots!
        DBManage.shareInstance.checkPrimaryKey(item: item, play: play)
        delegate?.changeDelegate(title: play.rawValue)
        dismiss(animated: true)
    }

    @IBAction func cancel_bt(_ sender: Any) {
        dismiss(animated: true)
    }
}
