//
//  SearchItemViewModel.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/25.
//

import UIKit

class SearchItemViewModel {
    
    var coordinator: SearchItemCoordinator?
    
    func didFinish() {
        print("viewModel")
        coordinator?.didFinish()
    }
}
