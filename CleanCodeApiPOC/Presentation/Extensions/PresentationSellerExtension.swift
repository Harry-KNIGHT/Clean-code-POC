//
//  PresentationSellerExtension.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 08/09/2023.
//

import CoreLocation
import Foundation
import Domain

extension PresentationSeller {
	init(data: Seller) {
		self.id = data.id
		self.name = data.name
		self.description = data.description
		self.coordinate = CLLocationCoordinate2D(
			latitude: data.coordinate.latitude,
			longitude: data.coordinate.longitude
		)
	}
}
