//
//  LifeBarViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import Alamofire
import RxCocoa
import RxSwift

class LifeBarViewController: UIViewController, Storyboarded {

    var viewModel: LifeBarViewModel!
    
    fileprivate let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [Shopping] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchList()
        //loadData()
        
        
    }
 
    func fetchList() {
        
        guard let url = Bundle.main.url(forResource: "Shopping", withExtension: "json") else { return }
    
        AF.request(url)
            .responseDecodable(of: Shoppings.self) { [self] (response) in
                guard let shoppings = response.value else { return }
                self.items = shoppings.all
                
                print(shoppings.all[0].title)
                print(shoppings.all[1].title)
                print(shoppings.all[2].title)
                
                loadData()
                
            }
    }
   
    func loadData() {
        Observable.from(optional: items)
            .bind(to: tableView.rx.items(cellIdentifier: "cell2")) { index, element, cell in
                cell.textLabel?.text = "\(element)"
            }.disposed(by: disposeBag)
    }

}
