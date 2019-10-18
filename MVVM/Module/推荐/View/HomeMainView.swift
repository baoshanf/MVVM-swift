//
//  HomeMainView.swift
//  MVVM
//
//  Created by hans on 2019/10/14.
//  Copyright © 2019 hans. All rights reserved.
//

import UIKit

class HomeMainView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.bounds, style: UITableView.Style.plain)
        tableView.register(HomeCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return tableView
    }()

}
