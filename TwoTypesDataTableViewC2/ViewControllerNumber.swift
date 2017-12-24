//
//  ViewControllerNumber.swift
//  TwoTypesDataTableViewC2
//
//  Created by Anhdzai on 12/15/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class ViewControllerNumber: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var savebutton: UIBarButtonItem!
    
    var dataNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = dataNumber {
            textField.text = "\(data)"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIBarButtonItem, button === savebutton {
            dataNumber = Int(textField.text ?? "")
        }
    }
}
