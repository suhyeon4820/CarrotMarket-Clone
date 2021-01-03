//
//  HomeBarViewModel.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa

class HomeBarViewModel {
    
    var coordinator: HomeBarCoordinator?
    
    // 새창 열기
    func showProductTradePage() {
        coordinator?.showProductTradePage()
    }
    
    func showAddScreen() {
        coordinator?.showAddScreen()
    }
    
    func showSearcItem() {
        coordinator?.showSearcItem()
    }
    
    func showCategoryItem() {
        coordinator?.showCategoryItem()
    }
    
    func showAlarmItem() {
        coordinator?.showAlarmItem()
    }
    
}
