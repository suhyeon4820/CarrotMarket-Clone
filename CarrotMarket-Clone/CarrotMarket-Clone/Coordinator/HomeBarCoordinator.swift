//
//  productListCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import RxSwift

class HomeBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> Observable<Void> {
        let homeBarViewController: HomeBarViewController = .instantiate()
        let hoemBarViewModel = HomeBarViewModel()
        hoemBarViewModel.coordinator = self
        homeBarViewController.viewModel = hoemBarViewModel
        navigationController.setViewControllers([homeBarViewController], animated: false)
        return .never()
    }
    
    
    
}



//class HomeBarCoordinator: Coordinator {
//
//    var childCoordinators: [Coordinator] = []
//    var navigationController: UINavigationController
//
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//
//    func start() -> Observable<Void> {
//        <#code#>
//    }
//
//
//}
