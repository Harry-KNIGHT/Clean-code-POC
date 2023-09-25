//
//  PresentationSeller.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 08/09/2023.
//

import Foundation
import CoreLocation

struct PresentationSeller: Identifiable, Hashable {
	let id: String
	let name: String
	let description: String
	let coordinate: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D: Hashable {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
	}

	public func hash(into hasher: inout Hasher) {
		hasher.combine(latitude)
		hasher.combine(longitude)
	}
}
