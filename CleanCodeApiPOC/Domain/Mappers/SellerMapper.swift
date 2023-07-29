//
//  SellerMapper.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import Foundation
import CoreLocation
import API

extension Seller {
	init(dto: SellerDTO) {
		self.name = dto.name
		self.description = dto.description
		self.coordinate = CLLocationCoordinate2D(
			latitude: Double(dto.location.latitude) ?? 0,
			longitude: Double(dto.location.longitude) ?? 0
		)
	}
}
