//
//  Category.swift
//  SwiftyDo
//
//  Created by James Williams on 8/12/18.
//  Copyright © 2018 James Williams. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
