//
//  SellerServiceDefaultMock.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import Foundation

public final class SellerServiceDefaultMock: SellerService {
	public var shouldThrowError: Bool

	public init(shouldThrowError: Bool = false) {
		self.shouldThrowError = shouldThrowError
	}

	public func getSellers() async throws -> [SellerData] {
		guard let fileUrl = Bundle.module.url(forResource: "Sellers", withExtension: "json") else {
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
