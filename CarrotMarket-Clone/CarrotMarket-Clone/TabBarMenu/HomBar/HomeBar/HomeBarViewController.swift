//
//  productListViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa


class HomeBarViewController: UIViewController, Storyboarded {
    
    // MARK: - Binding
    var viewModel: HomeBarViewModel!
    
    private let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addButton)
        rxbind()
        navigationItem()
        
        let label = UILabel()
        label.textColor = .black
        label.text = "위치"
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)

    }

    
    // MARK: - RxBind
    func rxbind() {
        // 화면 이동
        addButton.rx.tap.bind { [self] in
            viewModel.showAddScreen()
        }.disposed(by: disposeBag)
    }
    
    // MARK: - NavigationItem
    func navigationItem() {
        let searchBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        let categoryBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3") , style: .plain, target: self, action: nil)
        let alarmBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell") , style: .plain, target: self, action: nil)
        searchBarButtonItem.tintColor = .black
        categoryBarButtonItem.tintColor = .black
        alarmBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItems = [categoryBarButtonItem, alarmBarButtonItem, searchBarButtonItem]
    }
    
    
    // MARK: - AddButton
    let addButton: UIButton = {
        let addButton = UIButton(type: .close)
        addButton.tintColor = .orange
        addButton.setTitleColor(.white, for: .normal)
        addButton.layer.frame = CGRect(x: 250, y: 450, width: 50, height: 50)
        addButton.backgroundColor = .orange
        //addButton.imageView?.image = UIImage(systemName: "plus.circle")
        addButton.layer.cornerRadius = 25
        addButton.layer.borderWidth = 0.25
        addButton.layer.borderColor = UIColor.lightGray.cgColor
        addButton.clipsToBounds = true
        return addButton
    }()
    
    func itemTable() {
        let products = ["가방", "노트북", "테이블"]
        
        let product: Observable<[String]> = Observable.of(products)
        
        product.bind(to: tableView.rx.items(cellIdentifier: "cell")) { (index, element, cell) in
            cell.textLabel?.text = element
        }.disposed(by: disposeBag)

    }
}

