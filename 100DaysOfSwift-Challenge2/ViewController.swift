//
//  ViewController.swift
//  100DaysOfSwift-Challenge2
//
//  Created by João Gabriel Dourado Cervo on 31/01/21.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping list"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
    }
    
    @objc func addNewItem() {
        let alertController = UIAlertController(title: "Register a new item", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak alertController] _ in
            guard let newItem = alertController?.textFields?[0].text else { return }
            
            self?.submit(newItem)
        }
        
        alertController.addAction(submitAction)
        
        present(alertController, animated: true)
    }
    
    func submit(_ newItem: String) {
        // faz algo
    }
    
    //MARK: Table View Controller methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }


}

