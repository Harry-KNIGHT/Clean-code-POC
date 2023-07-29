//
//  SellerService.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import Foundation

struct SellerService {
	func getSellers() async throws -> [SellerDTO] {
		let url = URL(string: "https://api.jsonserve.com/1lF0TA")

		guard let url else {
			throw ServiceErrors.wrongUrl

		}

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
			throw ServiceErrors.httpResponse
		}

		do {
			return try JSONDecoder().decode([SellerDTO].self, from: data)
		} catch {
			throw ServiceErrors.decoding
		}
	}
}
