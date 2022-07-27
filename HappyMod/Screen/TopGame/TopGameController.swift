//
//  TopGameController.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 07/07/2022.
//

import UIKit

class TopGameController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var bt_Top_Collection: [UIButton]!
    @IBOutlet weak var viewButtonTop: UIView!
    
    var data : [DataItemCategories] = []
    var data250 : [DataItemCategories] = []
    var data2020 : [DataItemCategories] = []
    var data2021 : [DataItemCategories] = []
    var currentButton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgGreen1
        createdTitleNaviGation(title: "Top Game",colorTitle: .gray,fontSize: 20)
        configUi()
        top250()
        top2021()
        top2020()
        configTableView()
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
    
    func top250(){
        let param = [
            "filter" : "id==**",
            "pageIndex":0,
            "pageSize":15,
            "sort": "-added"
        ] as! [String: AnyObject]
        RestManager.shared.getItemGenres(param: param) { arrayData in
            self.data250 = arrayData
            self.data = self.data250
            self.tableView.reloadData()
        }
        
    }
    
    func top2021(){
        let param = [
            "filter" : "id==**",
            "pageIndex":0,
            "pageSize":15,
            "sort": "topCurrentYear"
        ] as! [String: AnyObject]
        RestManager.shared.getItemGenres(param: param) { arrayData in
            self.data2021 = arrayData
        }
    }
    
    func top2020(){
        let param = [
            "filter" : "id==**",
            "pageIndex":0,
            "pageSize":15,
            "sort": "topPreviousYear"
        ] as! [String: AnyObject]
        RestManager.shared.getItemGenres(param: param) { arrayData in
            self.data2020 = arrayData
        }
    }

    @IBAction func bt_Click_top(_ sender: UIButton) {
        if currentButton != sender.tag{
            currentButton = sender.tag
            for i in 0..<bt_Top_Collection.count{
                if sender.tag == i{
                    changeIsSelected(i)
                    switch currentButton{
                    case 0 :    self.data = self.data250
                                self.tableView.reloadData()
                    case 1:     self.data = self.data2020
                                self.tableView.reloadData()
                    default:    self.data = self.data2021
                                self.tableView.reloadData()
                    }
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
    
    func reloadDataD(){
        
    }
}

extension TopGameController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopGameMainTableViewCell")as! TopGameMainTableViewCell
        cell.bindData(data: data[indexPath.row], number: indexPath.row+1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailGameViewController()
        vc.data = data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


