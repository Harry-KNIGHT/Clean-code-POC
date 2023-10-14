//
//  File.swift
//  
//
//  Created by Elliot Knight on 30/07/2023.
//

import Foundation
import Api

/// The `SellerRepositoryDefault` class implements the `SellerRepository` protocol
/// and acts as a concrete repository for fetching sellers' data.
///
/// This repository uses a `SellerService` instance to fetch sellers' data from a remote API or data source.
public final class SellerRepositoryDefault: SellerRepository {
	private let service: SellerServiceDefault

	public init(service: SellerServiceDefault) {
		self.service = service
	}

	public func getSellers() async throws -> [SellerBusiness] {
		do {
			let sellersData = try await service.getSellers()
			// Map the fetched `SellerData` to an array of `Seller`
			// entities using the `SellerMapper` extension
			return sellersData.map { .init(data: $0) }
		} catch {
			throw SellerRepositoryError.cantGetSellers
		}
	}
}

public enum SellerRepositoryError: Error {
	case cantGetSellers
}
