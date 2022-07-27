//
//  MyGameController.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 07/07/2022.
//

import UIKit

class MyGameController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var bt_Top_Collection: [UIButton]!
    @IBOutlet weak var viewButtonTop: UIView!
    var currentButton = 0
    var dataWanted : [ItemReal] = []
    var dataPlaying: [ItemReal] = []
    var dataPlayed : [ItemReal] = []
    var data : [ItemReal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdTitleNaviGation(title: "My Game",colorTitle: .gray,fontSize: 20)
        view.backgroundColor = .bgGreen1
        readData()
        configUi()
        configTableView()
    }
    
    func readData(){
        let allData = DBManage.shareInstance.readData()
        for i in allData{
            if i.play == Play.wanted.rawValue{
                dataWanted.append(i)
            }
            else{
                if i.play == Play.playing.rawValue{
                    dataPlaying.append(i)
                }
                else{
                    dataPlayed.append(i)
                }
            }
        }
        data = dataWanted
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func configTableView(){
        tableView.backgroundColor = .clear
        tableView.backgroundView?.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TopGameMainTableViewCell", bundle: nil), forCellReuseIdentifier: "TopGameMainTableViewCell")
    }
    
    func configUi(){
        viewButtonTop.backgroundColor = .white
        viewButtonTop.clipsToBounds = true
        viewButtonTop.layer.cornerRadius = 20
        
        for i in 0..<bt_Top_Collection.count{
            bt_Top_Collection[i].clipsToBounds = true
            bt_Top_Collection[i].layer.cornerRadius = 17
            bt_Top_Collection[i].tintColor = .gray
        }
        changeIsSelected(0)
        
    }

    @IBAction func bt_Click_top(_ sender: UIButton) {
        if currentButton != sender.tag{
            currentButton = sender.tag
            switch currentButton{
            case 0: data = dataWanted
            case 1: data = dataPlaying
            default: data = dataPlayed
            }
            self.tableView.reloadData()
            for i in 0..<bt_Top_Collection.count{
                if sender.tag == i{
                    changeIsSelected(i)
                }
                else{
                   changeNotSelected(i)
                }
            }
        }
    }
    
    func changeIsSelected(_ sender : Int){
        bt_Top_Collection[sender].isSelected = true
        bt_Top_Collection[sender].backgroundColor = .green
        bt_Top_Collection[sender].tintColor = .white
    }
    func changeNotSelected(_ sender : Int){
        bt_Top_Collection[sender].isSelected = false
        bt_Top_Collection[sender].backgroundColor = .clear
        bt_Top_Collection[sender].tintColor = .gray
    }
}

extension MyGameController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopGameMainTableViewCell")as! TopGameMainTableViewCell
        cell.bindData2(data: data[indexPath.row], number: indexPath.row + 1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailGameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
