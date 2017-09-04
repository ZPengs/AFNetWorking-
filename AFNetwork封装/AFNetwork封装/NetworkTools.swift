//
//  NetworkTools.swift
//  AFNetwork封装
//
//  Created by ZPengs on 2017/8/31.
//  Copyright © 2017年 ZPengs. All rights reserved.
//
import UIKit
import AFNetworking
// 定义枚举类型
enum RequestType : String {
    case GET = "GET"
    case POST = "POST"
}

class NetworkTools: AFHTTPSessionManager {
    // let是线程安全的
    static let shareInstance : NetworkTools = {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        return tools
    }()
}
// MARK:- 封装请求方法
extension NetworkTools {
    func request(_ methodType : RequestType, urlString : String, parameters : [String : AnyObject], finished : @escaping (_ result : AnyObject?, _ error : NSError?) -> ()) {
        
        // 1.定义成功的回调闭包
        let successCallBack = { (task : URLSessionDataTask, result : AnyObject?) -> Void in
            finished(result, nil)
        }
        
        // 2.定义失败的回调闭包
        let failureCallBack = { (task : URLSessionDataTask?, error : NSError) -> Void in
            finished(nil, error)
        }
        
        // 3.发送网络请求
        if methodType == .GET {
            get(urlString, parameters: parameters, progress: nil, success: successCallBack as? (URLSessionDataTask, Any?) -> Void, failure: failureCallBack as? (URLSessionDataTask?, Error) -> Void)
        } else {
            post(urlString, parameters: parameters, progress: nil, success: successCallBack as? (URLSessionDataTask, Any?) -> Void, failure: failureCallBack as? (URLSessionDataTask?, Error) -> Void)
        }
        
    }
}
