//
//  ProductTradeCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/24.
//

import UIKit
import RxSwift

class ProductTradeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> Observable<Void> {
        let productTradeViewController: ProductTradeViewController = .instantiate()
        let productTradeViewModel = ProductTradeViewModel()
        productTradeViewModel.coordinator = self
        productTradeViewController.viewModel = productTradeViewModel
        navigationController.setViewControllers([productTradeViewController], animated: false)
        return Observable.never()
    }
    
    func showPage() {
        let productTradeViewController: ProductTradeViewController = .instantiate()
        navigationController.pushViewController(productTradeViewController, animated: true)
    }
    
}
