//
//  Seller.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 08/09/2023.
//

import Foundation
import CoreLocation

struct Seller: Identifiable, Equatable {
	let id: Int
	let name: String
	let description: String
	let coordinate: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D: Equatable {
	public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
		return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
	}
}

