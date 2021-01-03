//
//  ProductTradeViewModel.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2021/01/02.
//

import UIKit

class  ProductTradeViewModel {
    var coordinator: ProductTradeCoordiantor?
    
    func didFinish() {
        print("ViewModel")
        coordinator?.didFinish()
    }
}
