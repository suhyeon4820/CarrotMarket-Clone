//
//  Shoppings.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import Foundation

struct Shoppings: Decodable {
<<<<<<< HEAD
    let index: Int
    let all: [Shopping]
    
    enum CodingKeys: String, CodingKey {
        case index
=======
    //let index: Int
    let all: [Shopping]
    
    enum CodingKeys: String, CodingKey {
        //case index
>>>>>>> 1a51edbabe5a7bde07147e1ee81d9a04b8888d9c
        case all = "results"
    }
}
