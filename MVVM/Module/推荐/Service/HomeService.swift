//
//  HomeService.swift
//  MVVM
//
//  Created by hans on 2019/10/12.
//  Copyright © 2019 hans. All rights reserved.
//

import Moya
import SwiftyJSON

//超时时间
private var requestTimeout: Double = 10

///endpointClosure
private let myEndpointClosure = { (target: HomeAPI) -> Endpoint in
    
    let url = target.baseURL.absoluteString + target.path
    
    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
    )
    
    switch target {
    case .home:
        requestTimeout = 5
        return endpoint
    }
}

struct HomeService {
    static let provider = MoyaProvider<HomeAPI>(endpointClosure: myEndpointClosure)
    
    static func request(_ target: HomeAPI, successCallback:@escaping(Array<HomeModel>) -> Void,failure failureCallback: @escaping(String) -> Void){
        provider.request(target){ (result) in
            switch result{
            case let .success(response):
                if let json = try? JSON(data: response.data){
                    //处理好的回调数组
                    var results = [HomeModel]()
                    //服务器返回的数组
                    let datas: Array = json["data"].arrayValue
                    //遍历解析
                    datas.forEach({ dic in
                        let model = HomeModel.deserialize(from: dic.dictionary)
                        results.append(model!)
                    })
                    
                    successCallback(results)
                    print(json)
                }else{
                    print("请求失败")
                }
            case let .failure(error):
                failureCallback(error.errorDescription!)
            }
        }
    }
    ///MARK:-取消所有网络请求
    static func cancelAllRequest(){
        provider.manager.session.getAllTasks{ (tasks) in
            tasks.forEach {
                print("取消网络请求一次")
                $0.cancel()
            }
        }
    }
}
