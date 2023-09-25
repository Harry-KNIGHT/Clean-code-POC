//
//  SellerCard.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 25/09/2023.
//

import SwiftUI
import CoreLocation

struct SellerCard: View {
	let seller: PresentationSeller
	var body: some View {
		VStack(alignment: .leading) {
			Text(seller.name)
				.fontWidth(.expanded)
				.fontWeight(.semibold)
				.font(.title2)
			Text(seller.description)
				.fontWidth(.expanded)
				.font(.title3)
		}
		.padding(20)

		.foregroundStyle(.white)

		.background(Color.purple)
		.cornerRadius(20)
	}
}

#Preview {
	SellerCard(seller: .init(
		id: "Vendeur 1",
		name: "Vendeur 1",
		description: "Description du vendeur 1",
		coordinate: CLLocationCoordinate2D(
			latitude: 48.392829, longitude: 49.394839
		)
	))
}
