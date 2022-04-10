//
//  TableViewController.swift
//  myLab2
//
//  Created by Jorge Torres on 2022-03-08.
//

import UIKit

class TableViewController: UITableViewController {

    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item1 = ChecklistItem()
        
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        
        item2.text = "Brush my teeth"
        items.append(item2)
        
        let item3 = ChecklistItem()
        
        item3.text = "Learn IOS development"
        items.append(item3)
        
        let item4 = ChecklistItem()
        
        item4.text = "Soccer Practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        
        item5.text = "Eat Icecream"
        items.append(item5)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].text

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: items[indexPath.row])
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem){
        if item.checked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        configureCheckmark(for: cell, with: items[indexPath.row])
    }
    
    @IBAction func addItem(){
        let newRowIndex = items.count
        let item = ChecklistItem()
        
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    @IBAction func cancel(unwindSegue:UIStoryboardSegue){
    }
    
    @IBAction func done(unwindSegue:UIStoryboardSegue){
        addItem()
    }

}
