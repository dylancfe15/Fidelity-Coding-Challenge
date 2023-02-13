//
//  DetailsViewModel.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

final class DetailsViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var tweets = [Tweet]()
    private(set) var currency: Cryptocurrency

    var networkManager: DetailsNetworkManaging = DetailsNetworkManager()

    // MARK: - Initializers

    init(currency: Cryptocurrency) {
        self.currency = currency
    }

    // MARK: - Functions

    func getTweets() {
        networkManager.getTweets(for: currency.id) { [weak self] tweets in
            DispatchQueue.main.async {
                self?.tweets = tweets
            }
        }
    }
}
