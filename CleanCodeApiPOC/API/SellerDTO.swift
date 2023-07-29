//
//  SellerDTO.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import Foundation

/**
 SellerDTO

 A data transfer object representing a seller.

 - Properties: name, description, location.
 - Conforms to the Codable protocol.
 */
struct SellerDTO: Codable {
	let name: String
	let description: String
	let location: Location
}

/**
 Location

 A data transfer object representing a location.

 - Properties: latitude, longitude.
 - Conforms to the Codable protocol.
 */
struct Location: Codable {
	let latitude: String
	let longitude: String
}
