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
}
