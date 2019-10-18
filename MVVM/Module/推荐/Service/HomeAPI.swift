//
//  HomeService.swift
//  MVVM
//
//  Created by hans on 2019/10/12.
//  Copyright © 2019 hans. All rights reserved.
//

import Moya
import Result

enum HomeAPI {
    //定义参数
    case home(params:[String: Any])
}

extension HomeAPI: TargetType{
    ///定义参数
    var getPartmeters: [String: Any]{
        switch self {
        case let .home(param):
            return param
       
        }
    }
    ///设置请求类型
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: getPartmeters, encoding: JSONEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL{
        return URL(string: "https://www.apiopen.top/")!
    }
    var path: String{
        switch self {
        case .home:
            return "meituApi"
        }
    }
    
}
