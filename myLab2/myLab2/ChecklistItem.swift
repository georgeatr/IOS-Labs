//
//  ChecklistItem.swift
//  myLab2
//
//  Created by Jorge Torres on 2022-03-08.
//

import Foundation

class ChecklistItem {
    
    var text = ""
    
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
}
