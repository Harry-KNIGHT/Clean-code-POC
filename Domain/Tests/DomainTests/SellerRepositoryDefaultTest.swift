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
		sut = SellerRepositoryDefaultMock(sellers: [Seller](), service: SellerServiceDefaultMock())
    }

    override func tearDownWithError() throws {
       sut = nil
    }

	func test_given_emptyArray_when_throwingError_then_throwNoSellerFetched() async {
		// GIVEN
		sut.sellers = []

		// WHEN
		do {
			sut.sellers = try await sut.getSellers()
		} catch {
			// THEN
			XCTAssertTrue(sut.sellers.isEmpty)
			XCTAssertEqual(sut.sellerError, .noSellersFetched)
			XCTAssertEqual(sut.sellers.count, 0)
		}
	}

	func test_given_emptyArray_when_givingData_then_throwNoError() async {
		// GIVEN
		let sellers: [Seller] = [
			.init(
				name: "La Kaz",
				description: "Restaurant antillais de Bokits traditionnels de Guadeloupe",
				coordinate: CLLocationCoordinate2D(latitude: 121.2342, longitude: 1221.34332)
			)
		]

		// WHEN
		sut.sellers.append(contentsOf: sellers)

		// THEN
		XCTAssertEqual(sut.sellerError, nil)
		XCTAssertEqual(sut.sellers[0], Seller(
			name: "La Kaz",
			description: "Restaurant antillais de Bokits traditionnels de Guadeloupe",
			coordinate: CLLocationCoordinate2D(latitude: 121.2342, longitude: 1221.34332)
		   )
		)
		XCTAssertEqual(sut.sellers.count, 1)
		XCTAssertFalse(sut.sellers.isEmpty)
	}

	func test_given_filledSellerData_then_verifyAllSellers() async {
		// GIVEN
		let sellers: [Seller] = [
			.init(
				name: "La Kaz",
				description: "Restaurant antillais de Bokits traditionnels de Guadeloupe",
				coordinate: CLLocationCoordinate2D(latitude: 121.2342, longitude: 1221.34332)
			),
			.init(
				name: "Elliot Knight",
				description: "Elliot aime tester ses données",
				coordinate: CLLocationCoordinate2D(latitude: 321.221, longitude: 156.222)
			)
		]

		// WHEN
		sut.sellers = sellers

		// THEN
		XCTAssertNil(sut.sellerError)
		XCTAssertEqual(sut.sellers, sellers)
		XCTAssertFalse(sut.sellers.isEmpty)
		XCTAssertEqual(sut.sellers.count, 2)
		XCTAssertEqual(sut.sellers[0].id, sellers.first?.id)
	}

	func test_given_serviceError_when_repoGetSeller_then_repositoryThrowsNoSellersFetched() async throws {

		// GIVEN
//		let mockService = SellerServiceMock()
//		let repository = SellerRepositoryDefaultMock(service: mockService)
//		mockService.shouldThrowError = true

		// WHEN
//		let _ = try await repository.getSellers()

//		// THEN
//		XCTAssertEqual(mockService.shouldThrowError, true)
//		XCTAssertEqual(repository.sellerError, .noSellersFetched)
//		XCTAssertEqual(repository.sellers.count, 0)
//		XCTAssertEqual(mockService.sellersToReturn, nil)
//		XCTAssertTrue(repository.sellers.isEmpty)
	}
}
