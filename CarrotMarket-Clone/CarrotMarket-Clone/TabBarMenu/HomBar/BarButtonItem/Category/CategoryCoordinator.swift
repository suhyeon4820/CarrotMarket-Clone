//
//  CategoryCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/25.
//

import UIKit
import RxSwift

class CategoryCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @discardableResult
    func start() -> Observable<Void> {
        let categoryViewController: CategoryViewController = .instantiate()
        let categoryViewModel = CategoryViewModel()
        categoryViewModel.coordinator = self
        categoryViewController.viewModel = categoryViewModel
        navigationController.setViewControllers([categoryViewController], animated: false)

        return Observable.never()
    }
    
    
}
