//
//  File.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import RxSwift

class LifeBarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() -> Observable<Void> {
//        let lifeBarViewController: LifeBarViewController = .instantiate()
//        let lifeBarViewModel = LifeBarViewModel()
//        lifeBarViewModel.coordinator = self
//        lifeBarViewController.viewModel = lifeBarViewModel
//        navigationController.setViewControllers([lifeBarViewController], animated: false)
        return .never()
    }
    
    
}
