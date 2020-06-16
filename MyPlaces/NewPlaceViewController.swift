//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Jasurbek Komilov on 17.06.2020.
//  Copyright © 2020 Jasurbek Komilov. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    // MARK:- Table view Delegate
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            
        } else {
            view.endEditing(true)
        }
    }
    

}


// MARK:- Text field Delegate


extension NewPlaceViewController: UITextFieldDelegate {
    
    // Hide keyboard by tapping on "Done"
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
