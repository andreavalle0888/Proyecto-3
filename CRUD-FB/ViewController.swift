//
//  ViewController.swift
//  CRUD-FB
//
//  Created by Germán Santos Jaimes on 11/4/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit
import Firebase
//clousere funciones anonimas que tienen propiedades de la clase 
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TablaEmpleados: UITableView!
    
    private var listaEmpleados = [Employee]()
    var employeeCollectionRef : CollectionReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TablaEmpleados.delegate = self
        TablaEmpleados.dataSource = self
        var empleado = Employee(firstName: "German", lastName: "SAntos", salary: 400.0)
        listaEmpleados.append(empleado)
        //apuntador esta apuntando al archivo
        employeeCollectionRef = Firestore.firestore().collection("employee")
        
    }
    //refrescando la vista
    //documentos = registros  solo que firebase se llama snapshot
    override func viewWillAppear(_ animated: Bool) {
        employeeCollectionRef.getDocuments { (snapshot, error) in
            if let error = error{
                debugPrint(error)
            }else{
                self.listaEmpleados.removeAll()
                for document in (snapshot?.documents)!{
                    // paso 1
                    //print(document.data())
                    
                    // paso 2
                    let data = document.data()
                    // esta diciendo que le de los datos
                    let firstname = data["firstName"] as! String
                    //aqui se esta casteando
                    let lastname = data["lastName"] as! String
                    let salary = data["salary"] as? Double ?? 0.00
                    let timestamp = data["timestamp"] as! Date ?? Date()
                    
                    let documentId = document.documentID
                    
                    let newEmployee = Employee(firstName: firstname, lastName: lastname, salary: salary)
                    
                    self.listaEmpleados.append(newEmployee)
                }
                 self.TablaEmpleados.reloadData()
            }
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEmpleados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = TablaEmpleados.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EmployeeCell{
            cell.configureCell(employee: listaEmpleados[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
            //me retorna una celda vacía solo para que no truene el programa
        }
    }

}

