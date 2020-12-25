//
//  TabBarViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/24.
// 

import UIKit
import RxSwift

class TabBarViewController: UITabBarController {
    
    let tab0 = HomeBarCoordinator(navigationController: UINavigationController())
    let tab1 = LifeBarCoordinator(navigationController: UINavigationController())
    let tab2 = LocationBarCoordinator(navigationController: UINavigationController())
    let tab3 = ChattingBarCoordinator(navigationController: UINavigationController())
    let tab4 = MyCarrotBarCoordinator(navigationController: UINavigationController())
 
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [tab0.navigationController,
                           tab1.navigationController,
                           tab2.navigationController,
                           tab3.navigationController,
                           tab4.navigationController]
        tab0.start()
        tab1.start()
        tab2.start()
        tab3.start()
        tab4.start()

    }
    
}
