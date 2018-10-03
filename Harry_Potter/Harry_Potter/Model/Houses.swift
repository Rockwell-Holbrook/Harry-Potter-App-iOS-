//
//  Houses.swift
//  Harry_Potter
//
//  Created by Rockwell Holbrook on 10/2/18.
//  Copyright © 2018 Rockwell Holbrook. All rights reserved.
//

import Foundation

typealias Houses = [SchoolHouse]

struct SchoolHouse: Decodable {
    let id, name, mascot, headOfHouse: String
    let houseGhost, founder: String
    let v: Int
    let school: String?
    let members, values, colors: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, mascot, headOfHouse, houseGhost, founder
        case v = "__v"
        case school, members, values, colors
    }
}

