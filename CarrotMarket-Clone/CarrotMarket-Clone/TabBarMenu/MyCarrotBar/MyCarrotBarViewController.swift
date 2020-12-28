//
//  MyCarrotBarViewController.swift
//  CarrotMarket-Clone
//
//  Created by suhyeon on 2020/12/21.
//

import UIKit

class MyCarrotBarViewController: UIViewController, Storyboarded {

    var viewModel: MyCarrotBarViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        view.backgroundColor = .green
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
