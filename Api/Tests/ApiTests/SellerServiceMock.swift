//
//  SellerServiceMock.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import Foundation
@testable import Api

final class SellerServiceMock: SellersService {
	var sellersToReturn: [SellerData]?
	var shouldThrowError: Bool = false

	func getSellers() async throws -> [SellerData] {
		if shouldThrowError {
			throw ServiceErrors.decoding
		}
		guard let sellers = sellersToReturn else {
			throw ServiceErrors.decoding
		}

		return sellers
	}
}
