//
//  SellerRepositoryDefaultMock.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import Foundation
import CoreLocation
import Api
import Domain

final class SellerRepositoryDefaultMock: SellerRepository {
	public var sellers: [Seller]
	public var sellerError: SellerErrorsMock?
	private let service: SellerServiceMock

	init(sellers: [Seller] = [], sellerError: SellerErrorsMock? = nil, service: SellerServiceMock) {
		self.sellers = sellers
		self.sellerError = sellerError
		self.service = service
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
