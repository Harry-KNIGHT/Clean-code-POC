//
//  SellerRepositoryDefaultMock.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import Foundation
import CoreLocation
import Domain

final class SellerRepositoryDefaultMock: SellerRepository, ObservableObject {
	@Published public var sellers: [Seller]
	@Published public var sellerError: SellerErrorsMock?

	init(sellers: [Seller], sellerError: SellerErrorsMock?) {
		self.sellers = sellers
		self.sellerError = sellerError
	}

	public enum SellerErrorsMock: Error {
		case noSellersFetched
	}

	func getSellers() async throws -> [Seller] {
		if sellers.isEmpty {
			self.sellerError = .noSellersFetched
		}
		return	sellers
	}
}
