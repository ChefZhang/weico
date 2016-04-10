//
//  CZNetworkTools.swift
//  weico
//
//  Created by JohnZhang on 16/4/7.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import AFNetworking

enum RequestType: String {
    case GET = "GET"
    case POST = "POST"
}

class CZNetworkTools: AFHTTPSessionManager {
    
    static let shareInstance: CZNetworkTools = {
        let tools = CZNetworkTools()
        
        
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")

        return tools
    }()
}


// MARK: - 封装请求方法
extension CZNetworkTools {
    func request(requestType: RequestType, urlString: String, parameters: [String: AnyObject], finished: (result: AnyObject?, error: NSError?) -> ()) {
        
        let successCallBack =  { (task: NSURLSessionDataTask, result: AnyObject?) -> Void in
            finished(result: result, error: nil)
        }
        
        let failureCallBack = { (task: NSURLSessionDataTask?, error: NSError) -> Void in
            finished(result: nil, error: error)
        }
        
        if requestType == .GET {
            
            GET(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)

        } else {
            POST(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }
        
    }

}

// MARK:- 请求AccessToken
extension CZNetworkTools {
    func loadAccessToken(code: String, finished: (result: [String : AnyObject]?, error: NSError?) -> ()) {
        
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        let parameters = ["client_id" : app_key, "client_secret" : app_secret, "grant_type" : "authorization_code", "redirect_uri" : redirect_uri, "code" : code]
        
        request(.POST, urlString: urlString, parameters: parameters) { (result, error) -> () in
            finished(result: result as? [String : AnyObject], error: error)
            
        }
    }
}

// MARK:- 请求用户的信息
extension CZNetworkTools {
    func loadUserInfomation(access_token : String, uid : String, finished : (result : [String : AnyObject]?, error : NSError?) -> ()) {
        let urlString = "https://api.weibo.com/2/users/show.json"
        
        let parameters = ["access_token" : access_token, "uid" : uid]
        
        request(.GET, urlString: urlString, parameters: parameters) { (result, error) -> () in
            finished(result: result as? [String : AnyObject] , error: error)
        }
    }
}

// MARK: - 加载首页新数据
extension CZNetworkTools {
    func loadNewData(finished : (result : [[String : AnyObject]]?, error : NSError?) -> ()) {
        // 1.获取请求的URLString
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        // 2.获取请求的参数
        let parameters = ["access_token" : (CZUserAccountViewModel.shareInstance.account?.access_token)!]
        
        // 3.发送网络请求
        request(.GET, urlString: urlString, parameters: parameters) { (result, error) -> () in
            
            // 1.获取字典的数据
            guard let resultDict = result as? [String : AnyObject] else {
                finished(result: nil, error: error)
                return
            }
            
            // 2.将数组数据回调给外界控制器
            finished(result: resultDict["statuses"] as? [[String : AnyObject]], error: error)
        }
    }

}
