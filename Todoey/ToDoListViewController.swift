//
//  ViewController.swift
//  Todoey
//
//  Created by XINGYU MU on 3/12/19.
//  Copyright © 2019 XINGYU MU. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["One", "Two", "Three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    //MARK - Table view datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    
    
    
    
    //MARK - Table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new to do item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add new item", style: .default) { (action) in
            // what will happen once user click the add item
//            print("Success")
//            print(textField.text!)
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()

        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter new item name"
            textField = alertTextField
        }

        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

    
}

