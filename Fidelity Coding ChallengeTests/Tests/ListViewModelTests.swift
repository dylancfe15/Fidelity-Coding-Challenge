//
//  ListViewModelTests.swift
//  Fidelity Coding ChallengeTests
//
//  Created by Difeng Chen on 2/12/23.
//

import XCTest
import Combine
@testable import Fidelity_Coding_Challenge

final class ListViewModelTests: XCTestCase {

    // MARK: - Properties

    private var viewModel: ListViewModel!
    private var expectation: XCTestExpectation!
    private var cryptocurrenciesSubscription: AnyCancellable!

    // MARK: - Functions

    override func setUp() {
        super.setUp()

        viewModel = ListViewModel()
        viewModel.networkManager = ListMockNetworkManager()
    }

    override func tearDown() {
        super.tearDown()

        viewModel = nil
        expectation = nil
        cryptocurrenciesSubscription = nil
    }

    private func testGetCryptocurrenciest() {
        expectation = expectation(description: "Get Cryptocurrencies")

        cryptocurrenciesSubscription = viewModel.$cryptocurrencies.eraseToAnyPublisher().sink(receiveValue: { cryptocurrencies in
            XCTAssertFalse(cryptocurrencies.isEmpty)

            self.expectation.fulfill()
        })

        viewModel.getCryptocurrencies()

        waitForExpectations(timeout: 3)
    }

    private func testIsCryptocurrenceFavorite() {
        viewModel.favoriteButtonAction(for: "abc")

        XCTAssertNotNil(viewModel.favoriteCryptocurrencies["abc"])
        XCTAssertNil(viewModel.favoriteCryptocurrencies["123"])
    }

    private func testFavoriteButtonAction() {
        viewModel.favoriteButtonAction(for: "abc")

        XCTAssertNotNil(viewModel.favoriteCryptocurrencies["abc"])
        XCTAssertNil(viewModel.favoriteCryptocurrencies["123"])
    }
}
