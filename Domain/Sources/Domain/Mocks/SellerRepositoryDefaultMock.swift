//
//  SellerRepositoryDefaultMock.swift
//  
//
//  Created by Elliot Knight on 26/08/2023.
//

import Foundation
import CoreLocation
import Api

public final class SellerRepositoryDefaultMock: SellerRepository {
	private let service: SellerServiceDefaultMock

	public init(service: SellerServiceDefaultMock) {
		self.service = service
	}

	public func getSellers() async throws -> [Seller] {
		do {
			let sellers = try await service.getSellers()
			let convertedSeller = sellers.map { Seller(data: $0) }
			return convertedSeller
		} catch {
			throw SellerRepositoryError.cantGetSellers
		}
	}
}
