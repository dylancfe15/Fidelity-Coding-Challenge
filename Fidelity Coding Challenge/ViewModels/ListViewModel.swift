//
//  ListViewModel.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation
import CoreData

final class ListViewModel: ObservableObject {

    // MARK: - Properties

    @Published var cryptocurrencies = [Cryptocurrency]()
    @Published private(set) var favoriteCryptocurrencies = [String: FavoriteCryptocurrency]()

    var networkManager: ListNetworkManaging = ListNetworkManager()

    init() {
        favoriteCryptocurrencies = Dictionary(uniqueKeysWithValues: CoreDataManager.shared.fetchFavoriteCryptocurrencies()?.map { ($0.id ?? "", $0) } ?? [])
    }

    // MARK: - Functions

    func getCryptocurrencies() {
        // TODO: - It would be better to do pagination, but I can't find the doc that
        networkManager.getCryptocurrencies { [weak self] cryptocurrencies in
            DispatchQueue.main.async {
                self?.cryptocurrencies = cryptocurrencies
            }
        }
    }

    func isCryptocurrenceFavorite(id: String) -> Bool {
        favoriteCryptocurrencies[id] != nil
    }

    func favoriteButtonAction(for id: String) {
        if let currency = favoriteCryptocurrencies[id] {
            favoriteCryptocurrencies[id] = nil
            CoreDataManager.shared.deleteFavoriteCryptocurrency(currency: currency)
        } else {
            favoriteCryptocurrencies[id] = CoreDataManager.shared.saveFavoriteCryptocurrency(id: id)
        }
    }
}
