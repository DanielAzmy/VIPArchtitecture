//
//  HomePresenterProtocol.swift
//  VIPArchtitecture
//
//  Created by Daniel azmy on 07/06/2026.
//


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