//
//  SellerData.swift
//
//
//  Created by Elliot Knight on 29/07/2023.
//

import Foundation

public struct SellerService {
	
	public init() {}

	public func getSellers() async throws -> [SellerData] {
		let url = URL(string: "https://api.jsonserve.com/1lF0TA")

		guard let url else {
			throw ServiceErrors.wrongUrl

		}

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
			throw ServiceErrors.httpResponse
		}

		do {
			return try JSONDecoder().decode([SellerData].self, from: data)
		} catch {
			throw ServiceErrors.decoding
		}
	}
}
