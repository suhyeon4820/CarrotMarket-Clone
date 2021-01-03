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
import Floaty


class HomeBarViewController: UIViewController, Storyboarded {
    
    // MARK: - Binding
    var viewModel: HomeBarViewModel!
    
    /// 데이터를 저장할 배열
    var list = [SellList]()
    
    private let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // tableView
        tableView.delegate = self
        tableView.dataSource = self
        list = DataManager.shared.fetchTheDate()
        tableView.reloadData()
        tableView.register(HomeBarTableViewCell.nib(), forCellReuseIdentifier: HomeBarTableViewCell.identifier)
        
       
        let floaty = Floaty()
        floaty.buttonColor = #colorLiteral(red: 0.9960784314, green: 0.5450980392, blue: 0.2274509804, alpha: 1)
        floaty.plusColor = .white
   
        floaty.rotationDegrees = -135
        let reverseItem = floaty.items.reversed()
        floaty.paddingX = self.view.frame.width/6 - floaty.frame.width/2
        floaty.paddingY = self.view.frame.height/6 - floaty.frame.height/2
        
        floaty.addItem("중고거래", icon: UIImage(systemName: "house"), handler: {item in
            self.viewModel.showProductTradePage()
            floaty.close()
        }).buttonColor = .orange
        floaty.addItem("동네홍보", icon: UIImage(systemName: "house"))
        
        self.view.addSubview(floaty)

        rxbind()
        setTitle()
        navigationItem()
        NotificationCenter.default.addObserver(self, selector: #selector(uploadTable), name: Notification.Name("updateTable"), object: nil)
    }
    
    @objc func uploadTable() {
        self.list = DataManager.shared.fetchTheDate()
        self.tableView.reloadData()
    }
    
    // MARK: - RxBind
    func rxbind() {
        // 화면 이동
        
    }
    
    // MARK: - Title
    func setTitle() {
        let label = UILabel()
        label.textColor = .black
        label.text = "위치"
        label.font = .boldSystemFont(ofSize: 20)
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    // MARK: - NavigationItem
    func navigationItem() {
        let searchBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchPage))
        let categoryBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3") , style: .plain, target: self, action: #selector(showCategoryPage))
        let alarmBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell") , style: .plain, target: self, action:  #selector(showAlarmPage))
        searchBarButtonItem.tintColor = .black
        categoryBarButtonItem.tintColor = .black
        alarmBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItems = [categoryBarButtonItem, searchBarButtonItem, alarmBarButtonItem]
    }
    
    @objc func showSearchPage() {
        viewModel.showSearcItem()
    }
    
    @objc func showCategoryPage() {
        viewModel.showCategoryItem()
    }
    
    @objc func showAlarmPage() {
        viewModel.showAlarmItem()
    }

}

extension HomeBarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeBarTableViewCell.identifier, for: indexPath) as! HomeBarTableViewCell
        let data = list[indexPath.row]
        cell.uploadData(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deleteItems = list.remove(at: indexPath.row)
            DataManager.shared.deleteItem(item: deleteItems)
            tableView.deleteRows(at: [indexPath], with: .left)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
