//
//  RealmData.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 12/07/2022.
//

import Foundation
import RealmSwift

class ItemReal: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var play = Play.none.rawValue
    @Persisted var backgroundImage : String
    @Persisted var genres: String
    @Persisted var name: String
    @Persisted var rating: String
    @Persisted var released: String
    @Persisted var shortScreenshots: String
}

class DBManage{
    private var db : Realm
    static let shareInstance = DBManage()
    private init(){
        db = try! Realm()
    }
    
    func addData(_ object: ItemReal){
        
        try! db.write({
            db.add(object)
        })
    }
    
    func readData() -> Results<ItemReal>{
        let result : Results<ItemReal> = db.objects(ItemReal.self)
        return result
    }

    func deleteAnyObject(code: String){
        do {
            let realm = try Realm()
            let object = realm.objects(ItemReal.self).filter("id == %@", code)
            try! realm.write {
                    realm.delete(object)
            }
        } catch let error as NSError {
            print("error - \(error.localizedDescription)")
        }

    }
    
    func deleteAllObject(){
        do {
            let realm = try Realm()
            try! realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            print("error - \(error.localizedDescription)")
        }
    }
    
    func checkPrimaryKey(item: ItemReal,play: Play){
        do {
            let realm = try Realm()
            let object = realm.objects(ItemReal.self).filter("id = %@", item.id)
            guard object.first != nil else{
                try! realm.write({
                    let item = item
                    realm.add(item)
                })
                return
            }
            try! realm.write({
                realm.add(item, update: .modified)
            })
            return
        } catch  {
            return
        }
    }
    
}
