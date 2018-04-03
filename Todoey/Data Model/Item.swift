//
//  Item.swift
//  Todoey
//
//  Created by Ivan Timokhov on 03.04.2018.
//  Copyright © 2018 Ivan Timokhov. All rights reserved.
//

import Foundation

class Item {
    var name: String = ""
    var done: Bool = false
    convenience init (_ name: String, done: Bool) {
        self.init(name)
        self.done = done
    }
    init(_ name: String) {
        self.name = name
    }
}
