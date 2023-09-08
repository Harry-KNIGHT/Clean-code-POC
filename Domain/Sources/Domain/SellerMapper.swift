//
//  SellerMapper.swift
//
//
//  Created by Elliot Knight on 30/07/2023.
//

import Foundation
import Api

extension Seller {
	/// Initializes a new `Seller` instance using data from a `SellerData` object.
	///
	/// - Parameter data: The `SellerData` object containing seller information.
	/// - Note: This initializer extracts relevant data fields such as name, description,
	///   and coordinates from the `SellerData` object to create a `Seller` instance.
	///   It also converts latitude and longitude coordinates to a `CLLocationCoordinate2D`
	///   object for geospatial information.
	public init(data: SellerData) {
		self.name = data.name
		self.description = data.description
		self.coordinate = Coordinate(
			latitude: Double(data.coordinate.latitude) ?? 0,
			longitude: Double(data.coordinate.longitude) ?? 0
		)
	}
}
