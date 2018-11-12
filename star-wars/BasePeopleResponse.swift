//
//  BasePeopleResponse.swift
//  star-wars
//
//  Created by Livia Vasconcelos on 04/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class BasePeopleResponse: Mappable {
    var count:    Int?
    var next:     String?
    var previous: Int?
    var results:  [PersonResponse]?
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        count    <- map[APIFields.count]
        next     <- map[APIFields.next]
        previous <- map[APIFields.previous]
        results  <- map[APIFields.results]
    }
    
    private struct APIFields {
        static let count    = "count"
        static let next     = "next"
        static let previous = "previous"
        static let results  = "results"
    }
    
}

