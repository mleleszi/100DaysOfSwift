//
//  ViewController.swift
//  ShoppingList
//
//  Created by Marcell Leleszi on 2022. 05. 22..
//

import UIKit

class ViewController: UITableViewController {
    
    var items = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Shopping list"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.circle"), style: .plain, target: self, action: #selector(reset))
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    @objc func addItem() {
        let ac = UIAlertController(title: "Add an item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] _ in
            guard let input = ac?.textFields?[0].text else { return }
            self?.submit(input)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ input: String) {
        items.insert(input, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    @objc func reset() {
        items.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
}

