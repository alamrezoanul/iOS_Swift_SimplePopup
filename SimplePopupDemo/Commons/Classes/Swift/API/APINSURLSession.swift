//
//  APINSURLSession.swift
//  SimplePopupDemo
//
//  Created by TAHIYAH ALAM KHAN on 6/23/17.
//  Copyright © 2017 Rezoanul Alam Riad. All rights reserved.
//

import Foundation

class API_URLSession: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
    typealias CallbackBlock = (_ result: String, _ error: String?) -> ()
    var callback: CallbackBlock = {
        (resultString, error) -> Void in
        if error == nil {
            print(resultString)
        } else {
            
            print(error ?? "")
        }
        
        
        URLCredential.
    }
    
    
    
    func httpGet(request: NSMutableURLRequest!, callback: @escaping (String,
        String?) -> Void) {
        var configuration =
            URLSessionConfiguration.default
        var session = URLSession(session: configuration,
                                 didReceiveChallenge: self,
                                 completionHandler:OperationQueue.mainQueue())
        var task = session.dataTaskWithRequest(request){
            (data: NSData!, response: URLResponse!, error: NSError!) -> Void in
            if error != nil {
                callback("", error.localizedDescription)
            } else {
                var result = NSString(data: data, encoding: NSASCIIStringEncoding)!
                callback(result, nil)
            }
        }
        task.resume()
    }
    private func URLSession(session: URLSession,
                    didReceiveChallenge challenge:
        URLAuthenticationChallenge,
                    completionHandler:
        (URLSession.AuthChallengeDisposition,
        URLCredential?) -> Void) {
        completionHandler(
            URLSession.AuthChallengeDisposition.UseCredential,
            URLCredential(forTrust:
                challenge.protectionSpace.serverTrust))
    }
    
    private func URLSession(session: URLSession,
                    task: URLSessionTask,
                    willPerformHTTPRedirection response:
        HTTPURLResponse,
                    newRequest request: NSURLRequest,
                    completionHandler: (NSURLRequest!) -> Void) {
        var newRequest : NSURLRequest? = request
        print(newRequest?.description);
        completionHandler(newRequest)
    }
}
