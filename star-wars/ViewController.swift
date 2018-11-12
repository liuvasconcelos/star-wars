//
//  ViewController.swift
//  star-wars
//
//  Created by Livia Vasconcelos on 04/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var namesTableView: UITableView!
    
    var names = [String]()
    var nextURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namesTableView.delegate   = self
        namesTableView.dataSource = self
        
        APIHandler.shared.findPeople { (callback) in
            callback.onSuccess() { [weak self] response in
                
                guard let personList = response.results else {
                    return
                }
                
                let names = personList.map { person -> String in person.name ?? "" }
                self?.nextURL = response.next ?? ""
                self?.updateList(list: names)
            }
        }
    }
    
    func updateList(list: [String]) {
        names += list
        namesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = names[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == names.count - 1 {
            APIHandler.shared.findPeople(url: self.nextURL) { (callback) in
                callback.onSuccess() { [weak self] response in

                    guard let personList = response.results else {
                        return
                    }

                    let names = personList.map { person -> String in person.name ?? "" }
                    self?.nextURL = response.next ?? ""
                   
                    self?.updateList(list: names)
                }
            }
        }
    }
}
