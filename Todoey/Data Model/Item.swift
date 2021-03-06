//
//  Item.swift
//  Todoey
//
//  Created by Ivan Timokhov on 06.04.2018.
//  Copyright © 2018 Ivan Timokhov. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
