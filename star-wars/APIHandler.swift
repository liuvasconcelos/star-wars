//
//  APIHandler.swift
//  star-wars
//
//  Created by Livia Vasconcelos on 04/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIHandler {
    
    static let shared = APIHandler()
    let url: String = "https://swapi.co/api/people/1"

    
    func findPerson(_ loadCallback: @escaping (BaseCallback<PersonResponse>) -> Void) {
        Alamofire.request(url, method: .get).responseObject { (response: DataResponse<PersonResponse>) in
            switch(response.result) {
            case .success(let response):
                loadCallback(BaseCallback.success(response))
                break
            case .failure(let error):
                print(error)
                break
            }
            
        }
    }
    
    func findPeople(url: String = "https://swapi.co/api/people", _ loadCallback: @escaping (BaseCallback<BasePeopleResponse>) -> Void) {
        if url.isEmpty { return }
        Alamofire.request(url, method: .get).responseObject { (response: DataResponse<BasePeopleResponse>) in
            switch(response.result) {
            case .success(let response):
                loadCallback(BaseCallback.success(response))
                break
            case .failure(let error):
                print(error)
                break
            }
            
        }
    }
}
