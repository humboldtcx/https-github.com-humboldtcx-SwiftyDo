//
//  ViewController.swift
//  SwiftyDo
//
//  Created by James Williams on 8/7/18.
//  Copyright © 2018 James Williams. All rights reserved.
//

import UIKit

class TodoListViewController : UITableViewController {

    let itemArray = ["Clean Cat", "Eat Pudding", "Chew Leg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK - Setup the Table View
    
    // Set the number of rows to build
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // Fill the rows with a cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - TableView Delegate Method
    
    // Detect the row that is being selected and check it off.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

