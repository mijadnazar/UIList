//
//  ViewController.swift
//  UIList
//
//  Created by Mehdi Ijadnazar on 10/16/1402 AP.
//

import UIKit

class ViewController: UIViewController {
    
    let list = ["John", "Ryan", "Olivia", "Ted", "Ava"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UIList(on: list) { item in
            let label = UILabel()
            label.text = item
            
            return label
        }
            .frame(self.view.bounds)
        
        self.view.addSubview(tableView)
    }
}
