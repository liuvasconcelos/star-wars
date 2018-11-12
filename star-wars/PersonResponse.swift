//
//  Person.swift
//  star-wars
//
//  Created by Livia Vasconcelos on 04/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class PersonResponse: Mappable {
    var name:   String?
    var height: String?
    var mass:   String?
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        name   <- map[APIFields.name]
        height <- map[APIFields.height]
        mass   <- map[APIFields.mass]
    }
    
    private struct APIFields {
        static let name   = "name"
        static let height = "height"
        static let mass   = "mass"
    }
    
}
