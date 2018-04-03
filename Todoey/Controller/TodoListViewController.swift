//
//  ViewController.swift
//  Todoey
//
//  Created by Ivan Timokhov on 02.04.2018.
//  Copyright © 2018 Ivan Timokhov. All rights reserved.
//

import UIKit


class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

//    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        print(dataFilePath)
        
//        let newItem = Item("Find Mike", done: true)
//        itemArray.append(newItem)
//        let newItem2 = Item("Save the World")
//        itemArray.append(newItem2)
//        let newItem3 = Item("Slave the World")
//        itemArray.append(newItem3)
//

        loadItems()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item(textField.text!)
            
            self.itemArray.append(newItem)
            self.saveItems()

        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems () {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding ItemArray, \(error)")
        }
        tableView.reloadData()
    }
    
    func loadItems () {
        if let data = try? Data(contentsOf: dataFilePath!) {
           let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("error while decoding, \(error)")
            }
        }
    }
}

