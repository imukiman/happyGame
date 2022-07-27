//
//  DetailGameViewController.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 08/07/2022.
//

import UIKit
import Cosmos
class DetailGameViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var btAdd: UIButton!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    var data: DataItemCategories?
    var imgArray : [String] = []
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgGreen1
        guard let data = data else{
            return
        }
        configUiTop(data)
        configCollectionView()
    }
    
    @IBAction func btAdd_Click(_ sender: Any) {
        let vc = AddViewController()
        vc.data = data
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    func configButton(){
        let allData = DBManage.shareInstance.readData()
        for i in allData{
            if i.id == id{
                btAdd.setTitle(i.play.capitalized, for: .normal)
                return
            }
        }
    }
    
    func configCollectionView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PreviewMainTableViewCell", bundle: nil), forCellReuseIdentifier: "PreviewMainTableViewCell")
//        collectionView.backgroundColor = .clear
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(UINib(nibName: "PreviewMainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PreviewMainCollectionViewCell")
//        collectionView.register(UINib(nibName: "LikeMainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LikeMainCollectionViewCell")
    }
    
    func configUiTop(_ data: DataItemCategories){
        id = data.id!
        configButton()
        lblName.boldFont(sizeFont: 20, color: .black, title: data.name ?? "Name")
        lblDate.regularFont(sizeFont: 14, color: .gray, title: data.released ?? "Date")
        rating.rating = Double(data.rating!) ?? 0
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        btAdd.clipsToBounds = true
        btAdd.layer.cornerRadius = 10
        imgView.setImg(url: data.backgroundImage ?? "")
        imgArray = data.shortScreenshots!.components(separatedBy: " ~ ")
    }
}

extension DetailGameViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewMainTableViewCell")as! PreviewMainTableViewCell
            cell.data = imgArray
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewMainTableViewCell")as! PreviewMainTableViewCell
        cell.data = imgArray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
}
//extension DetailGameViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section >= 0{
//            return 1
//        }
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.section == 0{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewMainCollectionViewCell", for: indexPath) as! PreviewMainCollectionViewCell
//            cell.data = imgArray
//            return cell
//        }
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikeMainCollectionViewCell", for: indexPath)as! LikeMainCollectionViewCell
//        cell.data = 10
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.section == 0{
//            return CGSize(width: self.view.bounds.width-32, height: UIScreen.main.bounds.width*1.4/2.5)
//        }
//        else if (indexPath.section == 1){
//            return CGSize(width: self.view.bounds.width-32, height: 220)
//        }
//        return CGSize(width: self.view.bounds.width-32, height: 120)
//
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        if section == 0{
//            return CGSize(width: 20, height: 16)
//        }
//        return CGSize(width: 20, height: 16)
//    }
//}

extension DetailGameViewController: DelegateView{

    func changeDelegate(title: String) {
        self.configButton()
    }
}

