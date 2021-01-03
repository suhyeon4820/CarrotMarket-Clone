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
    // 부모 Coordinator
    var parentCoordinator: HomeBarCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @discardableResult
    func start() -> Observable<Void> {
        let searchItemViewController: SearchItemViewController = .instantiate()
        let searchItemViewModel = SearchItemViewModel()
        searchItemViewModel.coordinator = self
        searchItemViewController.viewModel = searchItemViewModel
        // setviewController와 pushviewcontroller의 차이
        navigationController.pushViewController(searchItemViewController, animated: true)
        return Observable.never()
    }
    // Parent로 돌아갈 때
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
        navigationController.dismiss(animated: true, completion: nil)
    }
    
}
