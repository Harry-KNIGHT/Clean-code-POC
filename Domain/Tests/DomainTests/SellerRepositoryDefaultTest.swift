//
//  SellerRepositoryDefaultTest.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import XCTest
import Domain
import CoreLocation

final class SellerRepositoryDefaultTest: XCTestCase {
	var repositorySut: SellerRepositoryDefaultMock!
	var serviceSut: SellerServiceDefaultMock!

	override func setUpWithError() throws {
		repositorySut = SellerRepositoryDefaultMock(service: SellerServiceDefaultMock())
		serviceSut = SellerServiceDefaultMock()
	}

	override func tearDownWithError() throws {
		repositorySut = nil
		serviceSut = nil
	}

	func test_given_emptyArray_when_givingData_then_checkData() async throws {
		do {
			// GIVEN
			serviceSut.serviceMockChoosen = .goodFormatMock

			// WHEN
			let sellers = try await repositorySut.getSellers()

			// THEN
			XCTAssertEqual(sellers[0], SellerBusiness(
				name: "Vendeur 1",
				description: "Description du vendeur 1",
				coordinate: Coordinate(latitude: 12.3456, longitude: 78.91011)
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
			serviceSut.serviceMockChoosen = .goodFormatMock

			// WHEN
			let serviceSellers = try await serviceSut.getSellers()
			let convertedSellers = serviceSellers.map { SellerBusiness(data: $0) }

			// THEN
			XCTAssertEqual(convertedSellers[1], SellerBusiness(
				name: "Vendeur 2",
				description: "Description du vendeur 2",
				coordinate: Coordinate(
					latitude: 23.4567,
					longitude: 89.10112)
			))
		}
	}
}
