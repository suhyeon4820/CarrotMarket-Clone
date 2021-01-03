//
//  ProductTradeCoordinator.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2021/01/02.
//

import UIKit
import RxSwift

class ProductTradeCoordiantor: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var parentCoordinator: HomeBarCoordinator?
    
    init (navigationcontroller: UINavigationController) {
        self.navigationController = navigationcontroller
    }
    
    @discardableResult
    func start() -> Observable<Void> {
        let productTradeViewController: ProductTradeViewController = .instantiate()
        let productTradeViewModel = ProductTradeViewModel()
        productTradeViewModel.coordinator = self
        productTradeViewController.viewModel = productTradeViewModel
        navigationController.pushViewController(productTradeViewController, animated: true)
        
        return Observable .never()
    }
    
    // Parent로 돌아갈 때
    func didFinish() {
        print("coordinator")
        parentCoordinator?.childDidFinish(self)
        navigationController.dismiss(animated: true, completion: nil)
    }
    
}
