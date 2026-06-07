//
//  HomeInteractorProtocol.swift
//  VIPArchtitecture
//
//  Created by Daniel azmy on 07/06/2026.
//

import Foundation

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
