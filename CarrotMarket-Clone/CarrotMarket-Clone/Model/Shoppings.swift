//
//  Shoppings.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import Foundation

struct Shoppings: Decodable {
    let index: Int
    let all: [Shopping]
    
    enum CodingKeys: String, CodingKey {
        case index
        case all = "results"
    }
}
