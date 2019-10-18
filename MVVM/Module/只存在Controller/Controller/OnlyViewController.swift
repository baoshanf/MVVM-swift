//
//  OnlyViewController.swift
//  MVVM
//
//  Created by hans on 2019/10/16.
//  Copyright © 2019 hans. All rights reserved.
//

import UIKit

class OnlyViewController: UIViewController {

    lazy var showLabel: UILabel = {
        let showLabel = UILabel()
        showLabel.textColor = UIColor.black
        showLabel.font = UIFont.systemFont(ofSize: 14)
        showLabel.frame = CGRect(x: 20, y: 0, width: 200, height: 30)
        showLabel.center = view.center
        return showLabel
    }()

    let mainView = OnlyMainView.init(frame: UIScreen.main.bounds)
    
    let viewModel = OnlyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() -> () {
        viewModel.titleClosure = { [weak self] (title) in
            self?.mainView.showLabel.text = title
        }
    }
}
