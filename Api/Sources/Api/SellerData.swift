//
//  SellerData.swift
//  
//
//  Created by Elliot Knight on 29/07/2023.
//

import Foundation

/// The `SellerData` struct represents information about a seller from `SellerService`,
/// including their name, description, and geographic coordinates.
public struct SellerData: Codable {
	public let name: String
	public let description: String
	public let coordinate: Coordinate

	public init(name: String, description: String, coordinate: Coordinate) {
		self.name = name
		self.description = description
		self.coordinate = coordinate
	}

	public enum CodingKeys: String, CodingKey {
		case name
		case description
		case coordinate = "location"
	}
}

public struct Coordinate: Codable {
	public let lat: String
	public let long: String

	public enum CodingKeys: String, CodingKey {
		case lat = "latitude"
		case long = "longitude"
	}
}
