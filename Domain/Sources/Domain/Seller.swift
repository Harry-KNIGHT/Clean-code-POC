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
public struct Seller: Identifiable {
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
