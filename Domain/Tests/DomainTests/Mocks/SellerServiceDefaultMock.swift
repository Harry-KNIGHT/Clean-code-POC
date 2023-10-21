//
//  SellerServiceDefaultMock.swift
//
//
//  Created by Elliot Knight on 08/09/2023.
//

import Foundation
import Api

/// The `SellerServiceDefaultMock` class implements the `SellerService` protocol and
/// serves as a mock service for fetching seller data based on selected mock scenarios.
///
/// This service allows you to choose between different mock scenarios by specifying
/// a `ServiceMocks` enum case when initializing the instance. It reads data from JSON
/// files associated with the chosen mock scenario for testing and development purposes.
final class SellerServiceDefaultMock: SellerService {
	public var serviceMockChoosen: ServiceMocks?

	public init(serviceMockChoosen: ServiceMocks? = .goodFormatMock) {
		self.serviceMockChoosen = serviceMockChoosen
	}

	public enum ServiceMocks: String {
		case goodFormatMock = "SellersMock"
		case badFormatMock = "SellersInvalidFormatMock"
		case wrongUrlMock = "WrongUrlMock"
	}

	/// Retrieves seller data based on the selected mock scenario asynchronously.
	///
	/// - Returns: An array of `SellerData` objects.
	/// - Throws: A `ServiceError` if an error occurs during data retrieval. Possible
	///   error scenarios include incorrect URL and JSON decoding errors.
	/// - Note: This method reads seller data from a JSON file associated with the
	///   chosen mock scenario. It can simulate errors if the JSON file format is
	///   incorrect or if the file is missing.
	func getSellers() async throws -> [SellerData] {

		let baseApi = BaseApiMock()

		guard let fileUrl = Bundle.module.url(
			forResource: serviceMockChoosen?.rawValue,
			withExtension: "json"
		) else {
			throw ServiceError.invalidUrl
		}

		do {
			let sellers = try await baseApi.sendRequest(url: fileUrl, responseModel: [SellerData].self)
			return sellers
		} catch {
			throw ServiceError.invalidDecoding
		}
	}
}
