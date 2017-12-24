//
//  ViewControllerWord.swift
//  TwoTypesDataTableViewC2
//
//  Created by Anhdzai on 12/15/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class ViewControllerWord: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var dataWord: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = dataWord
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIBarButtonItem, button === saveButton {
            dataWord = textField.text
        }
    }
}
