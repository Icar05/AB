//
//  RootClass.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import ObjectMapper

//MARK: - RootClass
public struct RootClass {
    
    public var city : City!
    public var cnt : Int!
    public var cod : String!
    public var list : [List]!
    public var message : Float!
    
}

extension RootClass : Mappable{
    
    public init?(map: Map) {}
    
    public mutating func mapping(map: Map) {
         city <- map["city"]
         cnt <- map["cnt"]
         cod <- map["cod"]
         list <- map["list"]
         message <- map["message"]
    }
    
    
}
