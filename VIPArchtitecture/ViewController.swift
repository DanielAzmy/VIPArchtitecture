//
//  ViewController.swift
//  VIPArchtitecture
//
//  Created by Daniel azmy on 04/06/2026.
//

import UIKit

//MARK: - Entity
struct HomeEntity {
    let title: String
}


//MARK: - View
protocol HomeViewProtocol: AnyObject {
    func show(title: String)
}

final class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: HomeViewProtocol {

    func show(title: String) {
        print(title)
    }
}

//MARK: - Relationships

//          HomeViewController
//                ↓
//          HomePresenter
//                ↓
//          HomeInteractor
//                ↓
//          HomeRepository
//                ↓
//          HomePresenter
//                ↓
//          HomeRouter
