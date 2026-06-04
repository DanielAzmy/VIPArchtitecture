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



//MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    func didFetchHome(entity: HomeEntity)
}

final class HomePresenter {

    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
}


extension HomePresenter: HomePresenterProtocol {

    func didFetchHome(entity: HomeEntity) {
        view?.show(title: entity.title)
    }
}




//MARK: - Interactor
protocol HomeInteractorProtocol: AnyObject {
    func fetchHomeData()
}

final class HomeInteractor {

    weak var presenter: HomePresenterProtocol?
    var repository: HomeRepositoryProtocol?
}

extension HomeInteractor: HomeInteractorProtocol {

    func fetchHomeData() {
        let entity = repository?.fetchHomeData()

        if let entity {
            presenter?.didFetchHome(entity: entity)
        }
    }
}




//MARK: - Repository
protocol HomeRepositoryProtocol: AnyObject {
    func fetchHomeData() -> HomeEntity
}

final class HomeRepository: HomeRepositoryProtocol {

    func fetchHomeData() -> HomeEntity {
        return HomeEntity(title: "home")
    }
}



//MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    func navigateToDetails()
}

final class HomeRouter {

    weak var viewController: UIViewController?
}

extension HomeRouter: HomeRouterProtocol {

    func navigateToDetails() {

        let detailsVC = UIViewController()
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }
}




//MARK: - Builder
final class HomeBuilder {

    static func build() -> UIViewController {

        let view = HomeViewController()

        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let repository = HomeRepository()
        let router = HomeRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        interactor.repository = repository

        router.viewController = view

        return view
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
