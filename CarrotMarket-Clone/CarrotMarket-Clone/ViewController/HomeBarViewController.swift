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
    
    @IBOutlet weak var titleLabel: UILabel!
    var viewModel: HomeBarViewModel!
    fileprivate let disposeBag = DisposeBag()
    
    var items: [Shopping] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nil
        fetchList()
    }
    
    func fetchList() {
        guard let url = Bundle.main.url(forResource: "Shopping", withExtension: "json") else { return }

//        AF.request(url)
//            .responseDecodable(of: Shoppings.self) { [self] (response) in
//                guard let shoppings = response.value else { return }
//
//                self.items = shoppings.all
//
//                print(shoppings.all[0].title)
//                print(shoppings.all[1].title)
//                print(shoppings.all[2].title)
//            }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        itemTable()
    }
    
    
    func itemTable() {
        //        let obs1 = Observable.just(items) // just , of 같게 나옴
        //        let obs3 = Observable.from(items)
        //        obs3.subscribe { event in
        //            print(event)
        //        }
        
//        Observable.from(items)
//            .subscribe({item in
//                print(item)
//
//            }).disposed(by: disposeBag)
//
//        Observable.from(items)
//            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, element, cell in
//                cell.textLabel?.text = "\(element)"
//            }.disposed(by: disposeBag)
        
//        let cities = ["London", "Vienna", "Lisbon"]
//        let citiesOb: Observable<[String]> = Observable.of(cities)
//        citiesOb.bind(to: tableView.rx.items(cellIdentifier: "cell")) { (index, element, cell) in
//            cell.textLabel?.text = element
//        }.disposed(by: disposeBag)
        
    }
}
