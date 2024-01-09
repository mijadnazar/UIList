//
//  OldWayViewController.swift
//  UIList
//
//  Created by Mehdi Ijadnazar on 10/19/1402 AP.
//

import UIKit

class OldWayViewController: UIViewController {
    
    let list = ["Amir", "Masoume", "Osame", "Mehdi", "Masoud"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OldWayUITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
    }
}

extension OldWayViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? OldWayUITableViewCell else {
            let defaultCell = UITableViewCell()
            
            return defaultCell
        }
        
        cell.configure(with: self.list[indexPath.row])
        
        return cell
    }
    
}

extension OldWayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // do something here
    }
}
