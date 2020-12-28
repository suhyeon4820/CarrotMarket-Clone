//
//  MyCarrotBarCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import RxSwift

class MyCarrotBarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> Observable<Void> {
        let myCarrotBarViewController: MyCarrotBarViewController = .instantiate()
        let myCarrotBarViewModel = MyCarrotBarViewModel()
        myCarrotBarViewModel.coordinator = self
        myCarrotBarViewController.viewModel = myCarrotBarViewModel
        navigationController.setViewControllers([myCarrotBarViewController], animated: false)
        return .never()
    }
    
    
}
