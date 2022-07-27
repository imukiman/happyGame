//
//  FeaturedController.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 07/07/2022.
//

import UIKit
import Kingfisher

class FeaturedController: UIViewController {

    @IBOutlet weak var tableViewSearch: UITableView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var viewSearch: UIView!
    
    var containerView = UIView()
    var dataSearch : [DataItemCategories] = []
    var dataUpComing: [DataItemCategories] = []
    var categories : [CategoriesData] = []
    var dataNewRelease: [DataItemCategories] = []
    var dataDiscover: [DataItemCategories] = []
    private var pendingRequestWorkItem: DispatchWorkItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgGreen1
        createdTitleNaviGation(title: "Featured",colorTitle: .clear,fontSize: 20)
        configSearchBar()
        configTableView()

        readDataUpcoming()
        readDataRelease()
        readDataDiscover()
        readDataGenres()
    }
    
    func readDataUpcoming(){
        let param = [
            "filter" : "id==**",
            "pageIndex":0,
            "pageSize":15,
            "sort": "upComingOrder"
        ] as! [String: AnyObject]
        RestManager.shared.getItemGenres(param: param) { arrData in
            self.dataUpComing = arrData
            self.tableView.reloadData()
        }
    }
    
    func readDataGenres(){
        let param = [
            "pageIndex": 0,
            "pageSize": 30
        ] as! [String: AnyObject]
        RestManager.shared.getGenres(param: param) { arrData in
            self.categories = arrData
            self.tableView.reloadData()
        }
    }
    
    func readDataRelease(){
        let param = [
            "filter" : "id==**",
            "pageIndex":0,
            "pageSize":15,
            "sort": "newReleaseOrder"
        ] as! [String: AnyObject]
        RestManager.shared.getItemGenres(param: param) { arrData in
            self.dataNewRelease = arrData
            self.tableView.reloadData()
        }
    }
    
    func readDataDiscover(){
        let param = [
            "filter" : "id==**",
            "pageIndex":0,
            "pageSize":15,
            "sort": "discoverOrder"
        ] as! [String: AnyObject]
        RestManager.shared.getItemGenres(param: param) { arrData in
            self.dataDiscover = arrData
            self.tableView.reloadData()
        }
    }
    
    func configSearchBar(){
        searchBar.searchTextField.backgroundColor = .clear
        searchBar.backgroundImage = UIImage()
        viewSearch.layer.cornerRadius = 20
        viewSearch.clipsToBounds = true
        searchBar.delegate = self
    }

    func configTableView(){
        tableViewSearch.tableFooterView = UIView()
        tableViewSearch.isHidden = true
        tableViewSearch.delegate = self
        tableViewSearch.dataSource = self
        tableViewSearch.clipsToBounds = true
        tableViewSearch.layer.cornerRadius = 10
        
        tableViewSearch.register(UINib(nibName: "SearchBarTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchBarTableViewCell")
        
        tableView.backgroundColor = .clear
        tableView.backgroundView?.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NewReleasesMainTableViewCell", bundle: nil), forCellReuseIdentifier: "NewReleasesMainTableViewCell")
        tableView.register(UINib(nibName: "UpComingMainTableViewCell", bundle: nil), forCellReuseIdentifier: "UpComingMainTableViewCell")
        tableView.register(UINib(nibName: "GenresMainTableViewCell", bundle: nil), forCellReuseIdentifier: "GenresMainTableViewCell")
    }
}
extension FeaturedController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tableViewSearch{
            return 1
        }
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewSearch{
            return dataSearch.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewSearch{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBarTableViewCell")as! SearchBarTableViewCell
            let url = URL(string: API.BASE_URL + dataSearch[indexPath.row].backgroundImage!)
            cell.imgView.kf.setImage(with: url)
            cell.lblName.text = dataSearch[indexPath.row].name!
            return cell
        }
        else{
            if indexPath.section == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "UpComingMainTableViewCell")as! UpComingMainTableViewCell
                cell.bindData(data: dataUpComing,parent: self)
                return cell
            }
            if indexPath.section == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "NewReleasesMainTableViewCell")as! NewReleasesMainTableViewCell
                cell.bindData(data: dataNewRelease, title: "Release", parent: self, pageGame:  .newRelease)
                return cell
            }
            if indexPath.section == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "NewReleasesMainTableViewCell")as! NewReleasesMainTableViewCell
                cell.bindData(data: dataDiscover, title: "Discover", parent: self,pageGame:  .dicCover)
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenresMainTableViewCell")as! GenresMainTableViewCell
            cell.bindData(data: categories, title: "Genres",parent: self)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableViewSearch{
            return 60
        }else{
            if indexPath.section == 0{
                return 220
            }
            if indexPath.section == 3{
                return 200
            }
            return 260
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViewSearch{
            let vc = DetailGameViewController()
            vc.data =  dataSearch[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension FeaturedController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pendingRequestWorkItem?.cancel()
        let requestWorkItem = DispatchWorkItem { [self] in
            if searchBar.text == ""{
                self.tableViewSearch.isHidden = true
            }
            else{
                let param = [
                    "filter" : "name==*\(searchBar.text!)*",
                    "pageIndex":0,
                    "pageSize":15,
                    "sort": "-added"
                ] as! [String: AnyObject]
                RestManager.shared.getItemGenres(param: param) { arrayData in
                    self.dataSearch = arrayData
                    if self.dataSearch.count != 0{
                        self.tableViewSearch.isHidden = false
                        self.tableViewSearch.reloadData()
                    }
                    else{
                        self.tableViewSearch.isHidden = true
                    }
                    
                }
            }
        }
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500),
                                      execute: requestWorkItem)
    }
}
