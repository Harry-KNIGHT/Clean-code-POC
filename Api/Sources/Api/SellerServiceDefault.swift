//
//  SellerServiceDefault.swift
//
//
//  Created by Elliot Knight on 29/07/2023.
//

import Foundation

/// The `SellerServiceDefault` struct provides method to interact with a remote API and fetch seller data.
public struct SellerServiceDefault: SellerService {

	public init() {}

	public func getSellers() async throws -> [SellerData] {
		let url = URL(string: "https://api.jsonserve.com/rLJWz-")

		guard let url else {
			throw ServiceError.invalidUrl

		}

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
			throw ServiceError.invalidHttpResponse
		}

		do {
			return try JSONDecoder().decode([SellerData].self, from: data)
		} catch {
			throw ServiceError.invalidDecoding
		}
	}
}

public protocol SellerService {
	func getSellers() async throws -> [SellerData]
}
