//
//  SellerRepositoryDefault.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import Foundation
import API
/**
 SellerRepositoryDefault

 A concrete implementation of the SellerRepository protocol.

 - Properties: api
 - Implements the getSellers() method to fetch sellers from the api and map them to Seller objects.
 */
final class SellerRepositoryDefault: SellerRepository {
	private let api: SellerService

	/**
	 Initializes the SellerRepositoryDefault with the provided api.

	 - Parameter api: An instance of the SellerService.
	 */
	init(api: SellerService) {
		self.api = api
	}

	func getSellers() async throws -> [Seller] {
		do {
			let sellers = try await api.getSellers()
			return sellers.map { Seller(dto: $0) }
		} catch {
			throw SellerRepositoryError.emptySellers
		}
	}
}

enum SellerRepositoryError: Error {
	case emptySellers
}
