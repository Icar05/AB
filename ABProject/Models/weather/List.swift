//
//  List.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation


public struct WeatherResponce: Codable{
    let cod: String
    let message: Int
    let cnt: Int
    let list: [List]
}

//MARK: - List
public struct List: Codable{
    
    public var clouds : Cloud!
    public var dt : Int!
    public var dtTxt : String!
    public var main : Main!
    public var rain : Rain!
    public var snow : Snow!
    public var sys : Sy!
    public var weather : [Weather]!
    public var wind : Wind!
    
}
