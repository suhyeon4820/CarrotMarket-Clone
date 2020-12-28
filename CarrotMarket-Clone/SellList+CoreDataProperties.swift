//
//  SellList+CoreDataProperties.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/27.
//
//

import Foundation
import CoreData


extension SellList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SellList> {
        return NSFetchRequest<SellList>(entityName: "SellList")
    }

    @NSManaged public var content: String?
    @NSManaged public var price: Int16
    @NSManaged public var category: String?
    @NSManaged public var title: String?
    @NSManaged public var image: Data?
    @NSManaged public var createdate: Date?

}

extension SellList : Identifiable {

}
