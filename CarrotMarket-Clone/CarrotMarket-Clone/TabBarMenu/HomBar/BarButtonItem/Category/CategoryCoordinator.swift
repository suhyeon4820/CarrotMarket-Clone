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
    
    var parentCoordinator: HomeBarCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @discardableResult
    func start() -> Observable<Void> {
        let categoryViewController: CategoryViewController = .instantiate()
        let categoryViewModel = CategoryViewModel()
        categoryViewModel.coordinator = self
        categoryViewController.viewModel = categoryViewModel
        navigationController.pushViewController(categoryViewController, animated: true)
        return Observable.never()
    }
    
    // Parent로 돌아갈 때
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    
}
