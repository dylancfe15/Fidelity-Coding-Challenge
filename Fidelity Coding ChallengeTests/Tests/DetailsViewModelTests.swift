//
//  DetailsViewModelTests.swift
//  Fidelity Coding ChallengeTests
//
//  Created by Difeng Chen on 2/13/23.
//

import XCTest
import Combine
@testable import Fidelity_Coding_Challenge

final class DetailsViewModelTests: XCTestCase {

    // MARK: - Properties

    private var viewModel: DetailsViewModel!
    private var expectation: XCTestExpectation!
    private var tweetsSubscription: AnyCancellable!

    // MARK: - Functions

    override func setUp() {
        super.setUp()

        viewModel = DetailsViewModel(currency: Cryptocurrency(id: "abc", name: nil, symbol: nil, rank: nil, circulating_supply: nil, total_supply: nil, max_supply: nil, beta_value: nil, first_data_at: nil, last_updated: nil, quotes: nil))
        viewModel.networkManager = DetailsMockNetworkManager()
    }

    override func tearDown() {
        super.tearDown()

        viewModel = nil
        expectation = nil
        tweetsSubscription = nil
    }

    private func testGetTweets() {
        expectation = expectation(description: "Get Tweets")

        tweetsSubscription = viewModel.$tweets.eraseToAnyPublisher().sink(receiveValue: { tweets in
            XCTAssertFalse(tweets.isEmpty)

            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 3)
    }
}
