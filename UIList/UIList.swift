//
//  UIList.swift
//  UIList
//
//  Created by Mehdi Ijadnazar on 10/19/1402 AP.
//

import UIKit

class UIList<T: Sequence>: UITableView, UITableViewDataSource, UITableViewDelegate {
    private var items: [T]
    private var identifier: String = ""
    
    private var containerView: (_ item: T) -> UIView
    private var didSelectRowAt: ((_ tableView: UITableView, _ item: T) -> Void)?
    
    init(on dataSource: [T], withCellIdentifier identifier: String = "Cell", _ cell: @escaping (_ item: T) -> UIView ) {
        self.items = dataSource
        self.containerView = cell
        self.identifier = identifier
        
        super.init(frame: .zero, style: .plain)
        
        self.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.dataSource = self
        self.delegate = self
        
        self.rowHeight = 50
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = containerView(self.items[indexPath.row])
        content.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath)
        cell.contentView.addSubview(content)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectRowAt?(tableView, items[indexPath.row])
    }
    
    func frame(_ rect: CGRect) -> Self {
        self.frame = rect
        
        return self
    }
}
