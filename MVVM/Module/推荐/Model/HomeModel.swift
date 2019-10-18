//
//  HomeModel.swift
//  MVVM
//
//  Created by hans on 2019/10/11.
//  Copyright © 2019 hans. All rights reserved.
//

import Foundation
import HandyJSON

struct HomeModel: HandyJSON {
//    https://www.apiopen.top/meituApi?page=1
    var createdAt: String?
    var publishedAt: String?
    var type: String?
    var url: String?
}

