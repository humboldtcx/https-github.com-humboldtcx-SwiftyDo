//
//  Item.swift
//  SwiftyDo
//
//  Created by James Williams on 8/12/18.
//  Copyright © 2018 James Williams. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    
    //Specify the parent relationship: type Category, the class. with the parent relationship called items,
    //  from the parent class forward relationship
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
