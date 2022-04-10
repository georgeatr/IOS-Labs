//
//  AddItemViewController.swift
//  myLab2
//
//  Created by Jorge Torres on 2022-03-08.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated:true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
}
