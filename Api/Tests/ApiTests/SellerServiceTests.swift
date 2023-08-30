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

	func test_getSellers() async throws {
		do {
			let sellers = try await sut.getSellers()

			XCTAssertEqual(sellers.count, 9)
		} catch {
			throw ServiceErrors.decoding
		}
	}
	func test_given_jsonOfSeller_when_decoding_then_receiveSwiftObject() async {
		do {
			// WHEN
			let sellers = try await sut.getSellers()

			// THEN
			XCTAssertEqual(sellers[0].name, "Vendeur 1")
			XCTAssertEqual(sellers.count, 8)
			XCTAssertFalse(sellers.isEmpty)
			XCTAssertEqual(sellers[0], SellerData(
				name: "Vendeur 1",
				description: "Description du vendeur 1",
				coordinate: Coordinate(
					lat: "12.3456",
					long: "78.91011")
			))
		} catch {
//			fatalError("Can't decode type")
		}
	}
}
