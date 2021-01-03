//
//  AlarmViewModel.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/25.
//

import UIKit

class AlarmViewModel {
    
    var coordinator: AlarmCoordinator?
    
    func didFinish() {
        coordinator?.didFinish()
    }
}
