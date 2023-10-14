//
//  SellersViewModelTests.swift
//  CleanCodeApiPOCTests
//
//  Created by Elliot Knight on 14/10/2023.
//

@testable import CleanCodeApiPOC
import XCTest
import Domain
import CoreLocation

final class SellersViewModelTests: XCTestCase {
	var sut: SellersViewModel!
    override func setUpWithError() throws {
		sut = SellersViewModel(
			repository: SellerRepositoryDefaultMock(
				service: SellerServiceDefaultMock(serviceMockChoosen: .goodFormatMock
												 )
			)
		)
    }

    override func tearDownWithError() throws {
		sut = nil
    }

	func test_fetchSellers() async {
		Task {
			// WHEN
			await sut.getSellers()

			// THEN
			XCTAssertEqual(sut.sellers.count, 2)
		}
	}
}
