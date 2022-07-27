//
//  GenresViewController.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 08/07/2022.
//

import UIKit
import SVPullToRefresh
class GenresViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionCatalog: UICollectionView!
    var pageIndex = 0
    var titleGenres = "Sports"
    var currrentIndex = 0
    var arrGenres : [CategoriesData] = []
    var dataItemGenres : [DataItemCategories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdTitleNaviGation(title: "Genres",colorTitle: .gray,fontSize: 20)
        view.backgroundColor = .bgGreen1
        configCollectionView()
        bindData(arrayString: arrGenres)
        readData(genres: titleGenres)
    }
    
    func readData(genres: String){
        let param = [
            "filter" : "genres==\(genres)",
            "pageIndex":pageIndex,
            "pageSize":15,
            "sort": "-added"
        ] as! [String: AnyObject]
        RestManager.shared.getItemGenres(param: param) { arrayData in
            self.dataItemGenres.append(contentsOf: arrayData)
            self.tableView.reloadData()
            self.tableView.infiniteScrollingView.stopAnimating()
            if self.pageIndex == 0 && self.dataItemGenres.count>0{
                self.tableView.scrollToRow(at: IndexPath(row: 0,section: 0),
                                           at: .top,
                                           animated: false)
            }
        }
    }
    
    func  bindData(arrayString: [CategoriesData]){
        self.arrGenres = arrayString
        self.collectionCatalog.reloadData()
    }

    func configCollectionView(){
        collectionCatalog.configCollectionView(minimumLineSpacing: 5, scrollDirection: .horizontal, cgSize: CGSize(width: 100, height: 50))
        collectionCatalog.dataSource = self
        collectionCatalog.delegate = self
        collectionCatalog.register(UINib(nibName: "GenresChildCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GenresChildCollectionViewCell")
        tableView.addInfiniteScrolling {
            self.tableView.infiniteScrollingView.startAnimating()
            self.pageIndex += 1
            self.readData(genres: self.titleGenres)
        }
        tableView.backgroundColor = .clear
        tableView.backgroundView?.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TopGameMainTableViewCell", bundle: nil), forCellReuseIdentifier: "TopGameMainTableViewCell")
    }
    
}
extension GenresViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrGenres.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenresChildCollectionViewCell", for: indexPath)as! GenresChildCollectionViewCell
        cell.bindData(text: arrGenres[indexPath.item].name!, isSelect: currrentIndex == indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if currrentIndex != indexPath.item{
            self.pageIndex = 0
            self.dataItemGenres = []
            self.currrentIndex = indexPath.item
            self.collectionCatalog.reloadData()
            self.titleGenres = arrGenres[indexPath.item].name!
            self.readData(genres: titleGenres)
        }
    }
}

extension GenresViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItemGenres.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopGameMainTableViewCell") as! TopGameMainTableViewCell
        cell.bindData(data: dataItemGenres[indexPath.row], number: indexPath.row + 1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailGameViewController()
        vc.data = dataItemGenres[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
