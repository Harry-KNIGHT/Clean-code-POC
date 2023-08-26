//
//  Seller.swift
//  
//
//  Created by Elliot Knight on 30/07/2023.
//

import Foundation
import CoreLocation

/// The `Seller` struct represents a seller entity with essential information such
/// as name, description, and geographic coordinates for business layer.
public struct Seller: Identifiable, Equatable {
	public static func == (lhs: Seller, rhs: Seller) -> Bool {
		return lhs.name == rhs.name
		&& lhs.description == rhs.description
		&& lhs.coordinate == rhs.coordinate

	}

	public var id: String { name }
	public let name: String
	public let description: String
	public let coordinate: CLLocationCoordinate2D

	public init(name: String, description: String, coordinate: CLLocationCoordinate2D) {
		self.name = name
		self.description = description
		self.coordinate = coordinate
	}
}

// This extension helps for make CLLocationCoordinate2D
// conforming to Equatable protocol for unit testing.
extension CLLocationCoordinate2D: Equatable {
	public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
		return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
	}
}
