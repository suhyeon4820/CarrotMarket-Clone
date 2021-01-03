//
//  LifeBarViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit
import RxCocoa
import RxSwift

class LifeBarViewController: UIViewController, Storyboarded {

    var viewModel: LifeBarViewModel!
    
    fileprivate let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadData()
        

        
        
    }
 

}
