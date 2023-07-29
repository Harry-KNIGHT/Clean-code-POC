//
//  Seller.swift
//  
//
//  Created by Elliot Knight on 30/07/2023.
//

import Foundation
import CoreLocation

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
