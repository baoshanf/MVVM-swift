//
//  HomeCell.swift
//  MVVM
//
//  Created by hans on 2019/10/14.
//  Copyright © 2019 hans. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(createAtLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var createAtLabel: UILabel = {
        let createAtLabel = UILabel.init(frame: CGRect(x: 10, y: 0, width: 300, height: 44))
        createAtLabel.textColor = UIColor.black
        return createAtLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
