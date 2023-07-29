//
//  File.swift
//  
//
//  Created by Elliot Knight on 30/07/2023.
//

import Foundation

import Foundation

public protocol SellerRepository {
	func getSellers() async throws -> [Seller]
}
