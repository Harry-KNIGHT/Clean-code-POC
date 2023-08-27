import XCTest
@testable import Api

final class ApiTests: XCTestCase {
	func test_given_getSeller_then_success() async throws {
		// GIVEN
		let mockService = SellerServiceMock()

		// WHEN
		mockService.sellersToReturn = [
			SellerData(
				name: "Elliot",
				description: "Bissap lover depuis 2020",
				coordinate: Coordinate(
					lat: "1.234",
					long: "1.2321"
				)
			)
		]

		// THEN
		XCTAssertEqual(mockService.sellersToReturn?.count, 1)
		XCTAssertEqual(mockService.sellersToReturn?[0].name, "Elliot")
	}

	func test_given_nilSellerData_then_throwError() async throws {
		// GIVEN
		let mockService = SellerServiceMock()

		// WHEN
		mockService.shouldThrowError = true
		mockService.sellersToReturn = nil

		// THEN
		XCTAssertNil(mockService.sellersToReturn)
		XCTAssertTrue(mockService.shouldThrowError)
		XCTAssertEqual(mockService.sellersToReturn, nil)
	}
	
	/*
	Test to move into domain for use SellerRepositoryDefault

	func test_given_getSellersOnService_then_failureOnRepository() async throws {
		// GIVEN
		let mockService = SellerServiceMock()
		mockService.shouldThrowError = true

	    let repository = SellerRepositoryDefault(service: mockService)

		// THEN
		XCTAssertThrowsError(try await repository.getSellers())
	}
	 */

	func test_given_jsonOfSeller_when_decoding_then_receiveSwiftObject() async {
		// GIVEN
		let data = Data("[{\"name\": \"La Maison du Bissap\", \"description\": \"Seller Description\", \"location\": {\"latitude\": \"12.3456\", \"longitude\": \"-78.9012\"}}]".utf8)

		do {
			// WHEN
			let container = try JSONDecoder().decode([SellerData].self, from: data)

			// THEN
			XCTAssertEqual(container[0].name, "La Maison du Bissap")
			XCTAssertEqual(container.count, 1)
			XCTAssertFalse(container.isEmpty)
			XCTAssertEqual(
				container[0],
				SellerData(
					name: "La Maison du Bissap",
					description: "Seller Description",
					coordinate: Coordinate(
						lat: "12.3456",
						long: "-78.9012"
					)
				)
			)
		} catch {
			fatalError("Can't decode type")
		}
	}
}
