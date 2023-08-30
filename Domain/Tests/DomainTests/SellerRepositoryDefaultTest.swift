//
//  SellerRepositoryDefaultTest.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import XCTest
import Domain
import CoreLocation
import Api

final class SellerRepositoryDefaultTest: XCTestCase {
	var sut: SellerRepositoryDefaultMock!

    override func setUpWithError() throws {
		sut = SellerRepositoryDefaultMock(service: SellerServiceDefaultMock())
    }

    override func tearDownWithError() throws {
       sut = nil
    }

	func test_given_emptyArray_when_givingData_then_checkData() async throws {
		do {
			// GIVEN && WHEN
			let sellers = try await sut.getSellers()

			// THEN
			XCTAssertEqual(sellers[0], Seller(
				name: "Vendeur 1",
				description: "Description du vendeur 1",
				coordinate: CLLocationCoordinate2D(latitude: 12.3456, longitude:  78.91011)
			))
			XCTAssertEqual(sellers.count, 10)
			XCTAssertFalse(sellers.isEmpty)
		} catch {
			fatalError("Something whent wrong.")
		}
	}
}
