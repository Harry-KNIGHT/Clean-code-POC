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
	public var sellerError: SellerErrorsMock?
	private let service: SellerServiceDefaultMock

	init(sellerError: SellerErrorsMock? = nil, service: SellerServiceDefaultMock) {
		self.sellerError = sellerError
		self.service = service
	}

	public enum SellerErrorsMock: Error {
		case noSellersFetched
	}

	func getSellers() async throws -> [Seller] {
		do {
			let sellers = try await service.getSellers()
			let convertedSeller = sellers.map { Seller(data: $0) }
			return convertedSeller
		} catch {
			throw SellerErrorsMock.noSellersFetched
		}
	}
}
