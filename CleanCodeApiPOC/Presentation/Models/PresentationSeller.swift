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

	static func == (lhs: PresentationSeller, rhs: PresentationSeller) -> Bool {
		lhs.id == rhs.id &&
		lhs.name == rhs.name &&
		lhs.description == rhs.description &&
		lhs.coordinate == rhs.coordinate
	}

	func hash(into hasher: inout Hasher) {
		  hasher.combine(id)
		  hasher.combine(name)
		  hasher.combine(description)

		  hasher.combine(coordinate.latitude)
		  hasher.combine(coordinate.longitude)
	  }
}

extension CLLocationCoordinate2D: Equatable {
	public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
		return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
	}
}
