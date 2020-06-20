//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Jasurbek Komilov on 15.06.2020.
//  Copyright © 2020 Jasurbek Komilov. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController {
    
    
    var places: Results<Place>! // аналог массива из БД REALM
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // отобразить данные при зауске приложения. Запрос объектов к БД
        places = realm.objects(Place.self) // не класс Place а тип
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)
        
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true

        return cell
    }
    
    
    // MARK:- Table View Delegate
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
        -> UISwipeActionsConfiguration? {
            // удаление объектов из БД и из таблицы
            let place = places[indexPath.row]
            let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
                // delete the item here
                StorageManager.deleteObject(place)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                completionHandler(true)
            }
            deleteAction.image = UIImage(systemName: "trash")
            deleteAction.backgroundColor = .systemRed
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
    }
    
    // MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return } // извлекаем Индекс выбранной строки
            
            let place = places[indexPath.row]
            let newPlaceVC = segue.destination as! NewPlaceViewController
            newPlaceVC.currentPlace = place
            
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        
        newPlaceVC.savePlace()
        tableView.reloadData()
    }
    
}
