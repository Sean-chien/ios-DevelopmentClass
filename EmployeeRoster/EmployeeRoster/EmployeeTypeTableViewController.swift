//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Sean Chien on 2019-09-13.
//

import UIKit

class EmployeeTypeTableViewController: UITableViewController {

    weak var delegate: EmployeeTypeDelegate?
    var employeeType: EmployeeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return EmployeeType.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeTypeCell", for: indexPath)
        
        let type = EmployeeType.all[indexPath.row]
        
        cell.textLabel?.text = type.description()
        
        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }


        return cell
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.employeeType = EmployeeType.all[indexPath.row]
        delegate?.didSelect(employeeType: employeeType!)
        tableView.reloadData()
    }

}

protocol EmployeeTypeDelegate: class {
    func didSelect(employeeType: EmployeeType)
}
