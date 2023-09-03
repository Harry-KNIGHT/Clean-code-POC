//
//  SellerServiceTests.swift
//  
//
//  Created by Elliot Knight on 29/08/2023.
//

import XCTest
@testable import Api

final class SellerServiceTests: XCTestCase {

	var sut: SellerServiceDefaultMock!
    override func setUpWithError() throws {
		sut = SellerServiceDefaultMock()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

	func test_given_getSellers_when_receiveObjects_then_verifyData() async {
		do {
			// GIVEN
			sut.serviceMockChoosen = .goodFormatMock

			// WHEN
			let sellers = try await sut.getSellers()

			// THEN
			XCTAssertFalse(sellers.isEmpty)
			XCTAssertEqual(sellers[0].name, "Vendeur 1")
			XCTAssertEqual(sellers[9].name, "Vendeur 10")
			XCTAssertEqual(sellers.count, 10)
			XCTAssertEqual(sellers[0], SellerData(
				name: "Vendeur 1",
				description: "Description du vendeur 1",
				coordinate: Coordinate(
					lat: "12.3456",
					long: "78.91011")
			))
		} catch {
			fatalError("It would never catch there")
		}
	}

	func test_given_getSellers_when_receivingBadFormattedData_then_throwError() async throws {
		// GIVEN
		sut.serviceMockChoosen = .badFormatMock

		do {
			// WHEN
			_ = try await sut.getSellers()
		} catch {
			// THEN
			XCTAssertEqual(error as? ServiceErrors, .decoding)
			XCTAssertEqual(sut.serviceMockChoosen, .badFormatMock)
		}
	}

	func test_given_wrongUrlMock_when_gettingSellers_then_throwError() async throws{
		// GIVEN
		sut.serviceMockChoosen = .wrongUrlMock

		do {
			// WHEN
			 _ = try await sut.getSellers()
		} catch {
			// THEN
			XCTAssertEqual(error as? ServiceErrors, .wrongUrl)
			XCTAssertEqual(sut.serviceMockChoosen, .wrongUrlMock)
		}
	}
}
