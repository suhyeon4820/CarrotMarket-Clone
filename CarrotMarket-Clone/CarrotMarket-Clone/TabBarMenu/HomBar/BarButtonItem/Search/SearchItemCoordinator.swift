//
//  SearchItemCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/25.
//

import UIKit
import RxSwift

class SearchItemCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @discardableResult
    func start() -> Observable<Void> {
        let searchItemViewController: SearchItemViewController = .instantiate()
        let searchItemViewModel = SearchItemViewModel()
        searchItemViewModel.coordinator = self
        searchItemViewController.viewModel = searchItemViewModel
        navigationController.setViewControllers([searchItemViewController], animated: false)
        return Observable.never()
    }
    
    
}
