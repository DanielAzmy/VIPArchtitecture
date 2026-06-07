//
//  HomeBuilder.swift
//  VIPArchtitecture
//
//  Created by Daniel azmy on 07/06/2026.
//

import UIKit

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
