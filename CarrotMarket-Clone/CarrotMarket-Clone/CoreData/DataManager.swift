//
//  CoreDataManager.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/26.
//

import UIKit
import CoreData


/*
 Create : context.save()
 Read : context.fetch(EntityName.fetchRequest())
 Update : 각 속성 값 newValue 대체 -> context.save()
 Delete : context.delete() -> context.save()
 */

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    // MARK: - Context (AppDelegate에서 가져옴)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Context 저장
    func saveMainContext() {
        // context 변화가 있다면
        if self.context.hasChanges {
            do {
                // context 저장
                try self.context.save()
            } catch {
                print(error)
            }
        }
    }
}

extension DataManager {
    
    // MARK: - Read
    func fetchTheDate() -> [SellList] {
        var list = [SellList]() ///NSManagedObject
        do {
            /// fetch the data from coreData
            list = try context.fetch(SellList.fetchRequest())
        } catch {
            print(error)
        }
        return list
    }
   
    
    // MARK: - Create
    func createItem(title: String, price: Int, category: String, content: String) {
        let newItems = SellList(context: context)
        newItems.title = title
        newItems.price = Int16(price)
        newItems.createdate = Date()
        //newItems.image =
        self.saveMainContext()
       //completion: (() -> ())? = nil
    }
    
    func titleCreateItem(title: String) {
        let newItems = SellList(context: context)
        newItems.title = title
        newItems.createdate = Date()
        self.saveMainContext()
    }
    
    func priceCreateItem(price: Int) {
        let newItems = SellList(context: context)
        newItems.price = Int16(price)
        self.saveMainContext()
    }
    
//    func categoryCreateItem(category: String) {
//        let newItems = SellList(context: context)
//        newItems.category = category
//        self.saveMainContext()
//    }
//    
//    func categoryCreateItem(content: String) {
//        let newItems = SellList(context: context)
//        newItems.content = content
//        self.saveMainContext()
//    }
    
    // MARK: - Update
//    func updateItem(item: SellList) {
//
//    }
//
    
    // MARK: - Delete
    func deleteItem(item: SellList) {
        context.delete(item)
        self.saveMainContext()
    }
}
