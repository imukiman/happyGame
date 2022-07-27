//
//  NewReleaseViewController.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 07/07/2022.
//

import UIKit
import APIManager
import SVPullToRefresh
import AVFoundation
class NewReleaseViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var pageIndex = 0
    var titleViewController : String = ""
    var pageGame : PageGame = .dicCover
    var data : [DataItemCategories] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgGreen1
        configTableView()
        bindData(title: titleViewController, pageGame: pageGame)
    }
    
    func configTableView(){
        
        tableView.addInfiniteScrolling {
            self.tableView.infiniteScrollingView.startAnimating()
            self.pageIndex += 1
            self.bindData(title: self.titleViewController, pageGame: self.pageGame)
        }
        
        tableView.backgroundColor = .clear
        tableView.backgroundView?.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TopGameMainTableViewCell", bundle: nil), forCellReuseIdentifier: "TopGameMainTableViewCell")
    }
    
    func bindData(title: String, pageGame: PageGame){
        createdTitleNaviGation(title: title, colorTitle: .gray, fontSize: 20)
        switch pageGame {
        case .newRelease:
            let param = [
                "filter" : "id==**",
                "pageIndex":pageIndex,
                "pageSize":15,
                "sort": "newReleaseOrder"
            ] as! [String: AnyObject]
            RestManager.shared.getItemGenres(param: param) { arrayData in
                self.data.append(contentsOf: arrayData)
                self.tableView.reloadData()
            }
        case .dicCover:
            let param = [
                "filter" : "id==**",
                "pageIndex":pageIndex,
                "pageSize":15,
                "sort": "discoverOrder"
            ] as! [String: AnyObject]
            RestManager.shared.getItemGenres(param: param) { arrayData in
                self.data.append(contentsOf: arrayData)
                self.tableView.reloadData()
            }
        case .genRes:
            let param = [
                "filter" : "genres==\(title)",
                "pageIndex":pageIndex,
                "pageSize":15,
                "sort": "-added"
            ] as! [String: AnyObject]
            RestManager.shared.getItemGenres(param: param) { arrayData in
                self.data.append(contentsOf: arrayData)
                self.tableView.reloadData()
            }
        default:
            return
        }
    }
}

extension NewReleaseViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopGameMainTableViewCell")as! TopGameMainTableViewCell
        cell.bindData(data: data[indexPath.row], number: indexPath.row+1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailGameViewController()
        vc.data = data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


