//
//  SellersServiceDefaultMock.swift
//  CleanCodeApiPOCTests
//
//  Created by Elliot Knight on 14/10/2023.
//

import Foundation
import Api

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
		guard let fileUrl = Bundle.main.url(
			forResource: serviceMockChoosen?.rawValue,
			withExtension: "json"
		) else {
			throw ServiceError.invalidUrl
		}

		let data = try Data(contentsOf: fileUrl)

		do {
			let sellers = try JSONDecoder().decode([SellerData].self, from: data)
			return sellers
		} catch {
			throw ServiceError.invalidDecoding
		}
	}
}
