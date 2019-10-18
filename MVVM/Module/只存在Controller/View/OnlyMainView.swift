//
//  OnlyMainView.swift
//  MVVM
//
//  Created by hans on 2019/10/16.
//  Copyright © 2019 hans. All rights reserved.
//

import UIKit

class OnlyMainView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(showLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var showLabel: UILabel = {
        let showLabel = UILabel()
        showLabel.textColor = UIColor.black
        showLabel.font = UIFont.systemFont(ofSize: 14)
        showLabel.frame = CGRect(x: 20, y: 0, width: 200, height: 30)
        showLabel.center = self.center
        return showLabel
    }()

}
