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
	var serviceSut: SellerServiceDefaultMock!

    override func setUpWithError() throws {
		sut = SellerRepositoryDefaultMock(service: SellerServiceDefaultMock())
		serviceSut = SellerServiceDefaultMock()

    }

    override func tearDownWithError() throws {
       sut = nil
		serviceSut = nil
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

	func test_given_sellerData_when_mapping_then_swiftObject() async throws {
		do {
			// GIVEN
			let serviceSellers = try await serviceSut.getSellers()

			// WHEN
			let convertedSellers = serviceSellers.map { Seller(data: $0) }

			// THEN
			XCTAssertEqual(convertedSellers[1], Seller(
				name: "Vendeur 2",
				description: "Description du vendeur 2",
				coordinate: CLLocationCoordinate2D(
					latitude: 23.4567,
					longitude: 89.10112)
			))
		}
	}
}
