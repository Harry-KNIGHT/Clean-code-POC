//
//  Seller.swift
//  
//
//  Created by Elliot Knight on 30/07/2023.
//

import Foundation

/// The `Seller` struct represents a seller entity with essential information such
/// as name, description, and geographic coordinates for the business layer.
///
/// This struct conforms to the `Identifiable` and `Equatable` protocols, allowing
/// it to be uniquely identified and compared for equality.
public struct Seller: Identifiable, Equatable {
	public var id: String { name }
	public let name: String
	public let description: String
	public let coordinate: Coordinate

	public init(name: String, description: String, coordinate: Coordinate) {
		self.name = name
		self.description = description
		self.coordinate = coordinate
	}
}

public struct Coordinate: Equatable {
	public let latitude: Double
	public let longitude: Double

	public init(latitude: Double, longitude: Double) {
		self.latitude = latitude
		self.longitude = longitude
	}
}
