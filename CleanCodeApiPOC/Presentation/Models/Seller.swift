//
//  Seller.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 08/09/2023.
//

import Foundation
import CoreLocation

struct Seller: Identifiable {
	let id: Int
	let name: String
	let description: String
	let coordinate: CLLocationCoordinate2D
}
