//
//  OnlyViewModel.swift
//  MVVM
//
//  Created by hans on 2019/10/16.
//  Copyright © 2019 hans. All rights reserved.
//

import UIKit

class OnlyViewModel: NSObject {

    let onlyModel: OnlyModel = OnlyModel()
    
    var titleClosure: ((_ title: String) -> Void)?
    
    override init() {
        super.init()
        onlyModel.title = "我是viewModel穿过来的"
        //延时三秒运行
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.titleClosure?(self?.getTitle() ?? "")
        }
    }

    func getTitle() -> String {
        return onlyModel.title ?? ""
    }
}
