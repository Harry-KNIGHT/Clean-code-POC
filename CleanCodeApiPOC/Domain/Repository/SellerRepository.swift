//
//  SellerRepository.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import Foundation

protocol SellerRepository {
	func getSellers() async throws -> [Seller]
}
