//
//  File.swift
//  
//
//  Created by Elliot Knight on 30/07/2023.
//

import Foundation
import Api

public final class SellerRepositoryDefault: SellerRepository {
	private let service: SellerService

	public init(service: SellerService) {
		self.service = service
	}

	public func getSellers() async throws -> [Seller] {
		do {
			let sellersData = try await service.getSellers()
			return sellersData.map { .init(data: $0) }
			
		} catch {
			throw SellerRepositoryError.cantGetSellers
		}
	}
}

enum SellerRepositoryError: Error {
	case cantGetSellers
}
