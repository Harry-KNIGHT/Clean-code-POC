//
//  SellersView.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import SwiftUI
import MapKit
import Api
import Domain

struct SellersView: View {
	@StateObject private var sellersVm = SellersViewModel(
		repository: SellerRepositoryDefault(service: SellerServiceDefault())
	)

	@StateObject var locationManager = LocationManager()
	@State private var selectedIem: PresentationSeller?
	@State private var showSheet = false

	var body: some View {
		Map(selection: $selectedIem) {
			ForEach(sellersVm.sellers) { seller in
				Marker(
					seller.name,
					coordinate: CLLocationCoordinate2D(
						latitude: seller.coordinate.latitude,
						longitude: seller.coordinate.longitude
					)
				)
				.tag(seller)
			}
		}
		.sheet(isPresented: $showSheet, content: {
			if let selectedIem {
				SellerDetailView(
					seller: selectedIem)
				.presentationDetents([.fraction(0.25), .large])
			}
		})
		.mapControls {
			MapUserLocationButton()
			MapCompass()
			MapScaleView()
		}
		.onChange(of: selectedIem) {
			showSheet.toggle()
		}
		.onAppear {
			locationManager.requestLocation()
		}
	}
}

struct SellersView_Previews: PreviewProvider {
	static var previews: some View {
		SellersView()
	}
}
