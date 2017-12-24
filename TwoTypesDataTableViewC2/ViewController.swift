//
//  ViewController.swift
//  TwoTypesDataTableViewC2
//
//  Created by Anhdzai on 12/15/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var AddWord: UIBarButtonItem!
    @IBOutlet var AddNumber: UIBarButtonItem!
    
    let intDataSource = IntDataSource()
    let stringDataSource = StringDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = intDataSource
        navigationItem.rightBarButtonItem = AddNumber
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let index = tableView.indexPathForSelectedRow {
            tableView.reloadRows(at: [index], with: .none)
        }
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender .isOn {
            tableView.dataSource = intDataSource
            navigationItem.rightBarButtonItem = AddNumber
        } else {
            tableView.dataSource = stringDataSource
            navigationItem.rightBarButtonItem = AddWord
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = tableView.indexPathForSelectedRow {
            if let data = segue.destination as? ViewControllerWord {
                data.dataWord = stringDataSource.array[index.row]
            } else if let data = segue.destination as? ViewControllerNumber {
                data.dataNumber = intDataSource.array[index.row]
            }
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let index = tableView.indexPathForSelectedRow {
            if let data = unwindSegue.source as? ViewControllerWord {
                stringDataSource.array[index.row] = data.dataWord ?? ""
            } else if let data = unwindSegue.source as? ViewControllerNumber {
                intDataSource.array[index.row] = data.dataNumber ?? 0
            }
            tableView.reloadRows(at: [index], with: .none)
        } else {
            if let data = unwindSegue.source as? ViewControllerWord {
                stringDataSource.array.append(data.dataWord ?? "")
            } else if let data = unwindSegue.source as? ViewControllerNumber {
                intDataSource.array.append(data.dataNumber ?? 0)
            }
            tableView.reloadData()
        }
    }
}

class IntDataSource: NSObject, UITableViewDataSource {
    var array = [1, 2, 3, 4, 5, 6, 7 ,8 ,9, 10]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataInt", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        cell.detailTextLabel?.text = ""
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if array.count == 0 {
            let noDataLable: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLable.text = "no data index"
            noDataLable.textColor = UIColor.red
            noDataLable.textAlignment = .center
            tableView.backgroundView = noDataLable
            tableView.separatorStyle = .none
        }
        return 1
    }
}

class StringDataSource: NSObject, UITableViewDataSource {
    var array = ["Một", "Hai", "Ba", "Bốn", "Năm", "Sáu", "Bảy", "Tám", "Chín", "Mười"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataString", for: indexPath)
        cell.textLabel?.text = ""
        cell.detailTextLabel?.text = array[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if array.count == 0 {
            let noDataLable: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLable.text = "no data Index"
            noDataLable.textColor = UIColor.red
            noDataLable.textAlignment = .center
            tableView.backgroundView = noDataLable
            tableView.separatorStyle = .none
        }
        return 1
    }
}
