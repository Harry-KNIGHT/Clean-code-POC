//
//  SellerDetailView.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 12/09/2023.
//

import SwiftUI
import CoreLocation

struct SellerDetailView: View {
	let seller: PresentationSeller
	var body: some View {
		VStack {
			Text(seller.name)
			Text(seller.description)
		}
	}
}

#Preview {
	SellerDetailView(
		seller: PresentationSeller(
			id: "Seller1",
			name: "Seller 1",
			description: "Description du vendeur 1",
			coordinate: CLLocationCoordinate2D(
				latitude: 1.2345,
				longitude: 1.3454
			)
		)
	)
}
