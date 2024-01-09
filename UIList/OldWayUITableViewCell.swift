//
//  OldWayUITableViewCell.swift
//  UIList
//
//  Created by Mehdi Ijadnazar on 10/19/1402 AP.
//

import UIKit

class OldWayUITableViewCell: UITableViewCell {
    
    private let customLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(customLabel)
        customLabel.frame = contentView.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        customLabel.text = text
    }
}
