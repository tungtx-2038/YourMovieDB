//
//  APIService.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/5/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import RxSwift
import netfox

struct APIService {

    static let shared = APIService()

    private var alamofireManager = Alamofire.SessionManager.default

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.protocolClasses?.insert(NFXProtocol.self, at: 0)
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }

    func request<T: Mappable>(input: BaseRequest) -> Observable<T> {

        print("\n------------REQUEST INPUT")
        print("link: %@", input.url)
        print("body: %@", input.body ?? "No Body")
        print("------------ END REQUEST INPUT\n")

        return Observable.create { observer in
            self.alamofireManager.request(input.url, method: input.requestType,
                                          parameters: input.body, encoding: input.encoding)
                .validate(statusCode: 200..<500)
                .responseJSON { response in
                    print(response.request?.url ?? "Error")
                    switch response.result {
                    case .success(let value):
                        if let statusCode = response.response?.statusCode {
                            if statusCode == 200 {
                                if let object = Mapper<T>().map(JSONObject: value) {
                                    observer.onNext(object)
                                    observer.onCompleted()
                                }
                            } else {
                                if let object = Mapper<ErrorResponse>().map(JSONObject: value) {
                                    observer.onError(BaseError.apiFailure(error: object))
                                } else {
                                    observer.onError(BaseError.httpError(httpCode: statusCode))
                                }
                            }
                        } else {
                            observer.on(.error(BaseError.unexpectedError))
                        }
                    case .failure:
                        observer.onError(BaseError.networkError)
                    }
            }
            return Disposables.create()
        }
    }
}
