//
//  SellerServiceDefaultMock.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import Foundation

public final class SellerServiceDefaultMock: SellerService {
	var serviceMockChoosen: ServiceMocks?

	public enum ServiceMocks: String {
		case sellersMock = "Sellers"
		case sellersBadFormatMock = "SellersBadFormatMock"
	}

	public init(serviceMockChoosen: ServiceMocks?) {
		self.serviceMockChoosen = serviceMockChoosen
	}

	public func getSellers() async throws -> [SellerData] {
		guard let fileUrl = Bundle.module.url(
			forResource: serviceMockChoosen?.rawValue,
			withExtension: "json"
		) else {
			throw ServiceErrors.wrongUrl
		}


		let data = try Data(contentsOf: fileUrl)

		do {
			let sellers = try JSONDecoder().decode([SellerData].self, from: data)
			return sellers
		} catch {
			throw ServiceErrors.decoding
		}
	}
}
