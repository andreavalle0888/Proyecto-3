//
//  AddEmployeeVC.swift
//  CRUD-FB
//
//  Created by Germán Santos Jaimes on 11/5/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit
import Firebase

class AddEmployeeVC: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var salary: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addEmployee(_ sender: UIButton) {
        let nombre = firstName.text
        let apellidos = lastName.text
        let salario = salary.text
        let tiempo = FieldValue.serverTimestamp()
        
        Firestore.firestore().collection("employee").addDocument(data: ["firstName": nombre, "lastName": apellidos, "salary": salario, "timestamp": tiempo]) { (error) in
            if let error = error{
                debugPrint(error)
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
