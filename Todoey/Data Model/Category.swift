//
//  Category.swift
//  Todoey
//
//  Created by Ivan Timokhov on 06.04.2018.
//  Copyright © 2018 Ivan Timokhov. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
