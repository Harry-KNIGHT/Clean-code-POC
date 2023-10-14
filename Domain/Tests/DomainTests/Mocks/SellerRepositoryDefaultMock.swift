//
//  SellerRepositoryDefaultMock.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import Foundation
import Api
import Domain

/// The `SellerRepositoryDefaultMock` class implements the `SellerRepository` protocol
/// and serves as a mock repository for retrieving seller data.
///
/// This repository utilizes a `SellerServiceMock` instance to retrieve seller data
/// from a local data source for testing and development purposes.
final class SellerRepositoryDefaultMock: SellerRepository {
	private let service: SellerService

	public init(service: SellerService) {
		self.service = service
	}

	func getSellers() async throws -> [SellerBusiness] {
		do {
			let sellers = try await service.getSellers()
			let convertedSeller = sellers.map { SellerBusiness(data: $0) }
			return convertedSeller
		} catch {
			throw SellerRepositoryError.cantGetSellers
		}
	}
}
