//
//  HomeRouterProtocol.swift
//  VIPArchtitecture
//
//  Created by Daniel azmy on 07/06/2026.
//

import UIKit

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
