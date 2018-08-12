//
//  CategoryViewController.swift
//  SwiftyDo
//
//  Created by James Williams on 8/10/18.
//  Copyright © 2018 James Williams. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }

    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category.name
        
        return cell
    }
    
    //MARK: - Data Manipulation Methods
    
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var newCategoryTextField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = newCategoryTextField.text!
            self.categories.append(newCategory)
            self.saveCategories()
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            newCategoryTextField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching data from context, \(error)")
        }
        tableView.reloadData()
    }

    
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
}
