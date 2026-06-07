//
//  HomeRepositoryProtocol.swift
//  VIPArchtitecture
//
//  Created by Daniel azmy on 07/06/2026.
//


//MARK: - Repository
protocol HomeRepositoryProtocol: AnyObject {
    func fetchHomeData() -> HomeEntity
}

final class HomeRepository: HomeRepositoryProtocol {

    func fetchHomeData() -> HomeEntity {
        return HomeEntity(title: "home")
    }
}

