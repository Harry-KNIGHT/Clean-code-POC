//
//  Seller.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import Foundation
import CoreLocation

/**
 Seller

 A data structure representing a seller.

 - Properties: name, description, coordinate.
 */
struct Seller: Identifiable {
	var id: String { name }
	let name: String
	let description: String
	let coordinate: CLLocationCoordinate2D
}
