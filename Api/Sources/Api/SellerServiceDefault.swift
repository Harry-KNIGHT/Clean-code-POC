//
//  SellerServiceDefault.swift
//
//
//  Created by Elliot Knight on 29/07/2023.
//

import Foundation

/// The `SellerServiceDefault` struct provides method to interact with a remote API and fetch `SellerData`.
public struct SellerServiceDefault: SellerService {

	private let api = ApiManagerDefault()

	public init() {}

	public func getSellers() async throws -> [SellerData] {
		do {
			let sellersData = try await api.sendRequest(
				url: URL(string: "https://api.jsonserve.com/rLJWz-"),
				responseModel: [SellerData].self)
			return sellersData
		} catch {
			throw ServiceError.unknown
		}
	}
}
