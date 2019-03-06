//
//  Checklistitem.swift
//  Checklist
//
//  Created by student on 20/2/2562 BE.
//  Copyright © 2562 Override. All rights reserved.
//

import Foundation

class ChecklistItem{
    var text = ""
    var checked = false
    
    func toggleCheck() {
        checked = !checked
    }
}
