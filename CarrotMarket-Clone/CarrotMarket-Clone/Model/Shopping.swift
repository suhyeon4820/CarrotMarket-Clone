//
//  Shopping.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import Foundation
// Decodable, which makes it possible to turn JSON into the data model
struct Shopping: Decodable {
    let title: String
    let location: String
    let price: String
    let image: String
}


