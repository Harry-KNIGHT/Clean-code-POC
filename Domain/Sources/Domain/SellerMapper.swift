//
//  SellerMapper.swift
//  
//
//  Created by Elliot Knight on 30/07/2023.
//

import Foundation
import CoreLocation
import Api

extension Seller {
	init(data: SellerData) {
		self.name = data.name
		self.description = data.description
		self.coordinate = CLLocationCoordinate2D(
			latitude: Double(data.coordinate.lat) ?? 0,
			longitude: Double(data.coordinate.long) ?? 0
		)
	}
}
