//
//  HomeViewModel.swift
//  MVVM
//
//  Created by hans on 2019/10/11.
//  Copyright © 2019 hans. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    //数据源
    var dataArray: Array<HomeModel?> = []
    //通知view更新的闭包
    var dataArrayClosure: (() -> Void)?
    
    //网络数据
    func fetchData() {
        let param = ["page":1]
        HomeService.request(HomeAPI.home(params: param), successCallback: { (results) in
            self.dataArray = results
            self.dataArrayClosure?()
               }) { (message) in
                   
               }
    }
    //tableview行数
    func rows() -> Int {
        return dataArray.count
    }
    //选中
    func selectRowData(index: Int) -> String {
        let homeModel = dataArray[index]
        return homeModel?.publishedAt ?? ""
    }
    
    //cell上的内容
    func createdAt(index: Int) -> String {
        let homeModel = dataArray[index]
        return homeModel?.createdAt ?? ""
    }
}
