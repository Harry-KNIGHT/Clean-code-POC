//
//  SellerServiceDefaultMock.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
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
	private let baseApiMock = BaseApiMock()
	var serviceMockChoosen: ServiceMocks?

	init(serviceMockChoosen: ServiceMocks? = .goodFormatMock) {
		self.serviceMockChoosen = serviceMockChoosen
	}

	enum ServiceMocks: String {
		case goodFormatMock = "SellersMock"
		case badFormatMock = "SellersInvalidFormatMock"
		case wrongUrlMock = "WrongUrlMock"
	}

	func getSellers() async throws -> [SellerData] {
		guard let fileUrl = Bundle.module.url(
			forResource: serviceMockChoosen?.rawValue,
			withExtension: "json"
		) else {
			throw ServiceError.invalidUrl
		}

		do {
			let sellers = try await baseApiMock.sendRequest(url: fileUrl, responseModel: [SellerData].self)
			return sellers
		} catch {
			throw ServiceError.unknown
		}
	}
}
