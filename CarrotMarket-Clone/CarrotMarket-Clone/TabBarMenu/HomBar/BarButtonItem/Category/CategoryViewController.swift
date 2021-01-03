//
//  CategoryViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/25.
//

import UIKit

class CategoryViewController: UIViewController, Storyboarded {

    var viewModel: CategoryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem()

    }
    
    func navigationItem() {
        /// leftBarButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(didFinish))
    }
    /// leftBarButtonItem action
    @objc func didFinish() {
        viewModel.didFinish()
        navigationController?.popViewController(animated: true)
    }

}
