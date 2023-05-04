//
//  HomeViewController.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 30/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var presenter = HomePresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func getData(list: [[Any]]) {
        print(list)
    }
}
