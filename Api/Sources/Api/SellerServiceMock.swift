//
//  SellerServiceMock.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import Foundation

public final class SellerServiceMock: SellersService {
	public var sellersToReturn: [SellerData]?
	public var shouldThrowError: Bool

	public init(sellersToReturn: [SellerData]? = nil, shouldThrowError: Bool = false) {
		self.sellersToReturn = sellersToReturn
		self.shouldThrowError = shouldThrowError
	}

	public func getSellers() async throws -> [SellerData] {
		if shouldThrowError {
			throw ServiceErrors.decoding
		}
		guard let sellers = sellersToReturn else {
			throw ServiceErrors.decoding
		}

		return sellers
	}
}
