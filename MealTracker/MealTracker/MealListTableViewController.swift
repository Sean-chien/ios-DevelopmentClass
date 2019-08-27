//
//  MealListTableViewController.swift
//  MealTracker
//
//  Created by Sean Chien on 2019-08-27.
//  Copyright © 2019 Sean Chien. All rights reserved.
//

import UIKit

class MealListTableViewController: UITableViewController {
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
    }()
    
    var meals: [Meal] = [
        Meal(name: "Sashimi", photo: UIImage(named: "sashimi")!, notes: "Ram fish Originated from Japan", rating: 10, timestamp: Date()),
        Meal(name: "Churrasco", photo: UIImage(named: "churrasco")!, notes: "Brazilian", rating: 10, timestamp: Date()),
        Meal(name: "Coxinha", photo: UIImage(named: "coxinha")!, notes: "", rating: 10, timestamp: Date()),
        Meal(name: "Feijoada", photo: UIImage(named: "feijoada")!, notes: "Stew Beans with meat and pork", rating: 10, timestamp: Date()),
        Meal(name: "Kebab", photo: UIImage(named: "kebab")!, notes: "Meat in skewers", rating: 10, timestamp: Date()),
        Meal(name: "Kimchi", photo: UIImage(named: "kimchi")!, notes: "Fermented Cabbage in red pepper from Korea", rating: 10, timestamp: Date()),
        Meal(name: "rulofan", photo: UIImage(named: "rulofan")!, notes: "Most popluar Taiwanese dish", rating: 10, timestamp: Date()),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MealDetail" {
            let destVC = segue.destination as! MealDetailViewController
            if let selectionIndexPath = tableView.indexPathForSelectedRow {
                destVC.meal = meals[selectionIndexPath.row]
            }
            
        }
    }

    // MARK:- UITableViewdataSource - data
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        cell.detailTextLabel?.text = meal.timestamp.description
        cell.imageView?.image = meal.photo
        
        return cell
    }
    
    // UITableViewDelegate - actions, looks

}

