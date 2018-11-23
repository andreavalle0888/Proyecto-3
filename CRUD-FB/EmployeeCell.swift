//
//  EmployeeCell.swift
//  CRUD-FB
//
//  Created by Germán Santos Jaimes on 11/5/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {

    
    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var firstName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(employee: Employee){
        salary.text = String(employee.salary)
        firstName.text = employee.firstName
        lastName.text = employee.lastName
    }

}
