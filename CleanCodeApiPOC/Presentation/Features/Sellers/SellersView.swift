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

	// TODO: Picker needs a publisher with a default value, this needs amelioration.
	@State private var selectedSeller: PresentationSeller = .init(
		id: "Vendeur inexistant",
		name: "Vendeur inexistant",
		description: "Description du vendeur inexistant",
		coordinate: .init(latitude: 0, longitude: 0)
	)

	@State private var mapCameraPosition: MapCameraPosition = .camera(.init(centerCoordinate: .init(latitude: 48.303929, longitude: 48.202930), distance: 1000))

	var body: some View {
		VStack {
			Map(position: $mapCameraPosition) {
				ForEach(sellersVm.sellers) { seller in
					Marker(
						seller.name,
						coordinate: CLLocationCoordinate2D(
							latitude: seller.coordinate.latitude,
							longitude: seller.coordinate.longitude)
					)
				}
			}
			.mapControls {
				MapUserLocationButton()
				MapCompass()
				MapScaleView()
			}

			Picker(
				"Choose seller you'd like to see",
				selection: $selectedSeller
			) {
				ForEach(sellersVm.sellers) { seller in
					Text(seller.name)
						.tag(seller)
				}
			}
			.pickerStyle(.menu)
			.onAppear {
				locationManager.requestLocation()
			}

			.onChange(of: selectedSeller) { oldValue, newValue in
				withAnimation {
					mapCameraPosition = .camera(
						.init(
							centerCoordinate: .init(
								latitude: newValue.coordinate.latitude,
								longitude: newValue.coordinate.longitude),
							distance: 1000)
					)
				}
				print("---- DEBUG: Seller old \(String(describing: oldValue)) ----")
				print("---- DEBUG: Seller new \(String(describing: newValue)) ----")
			}
		}
	}
}

struct SellersView_Previews: PreviewProvider {
	static var previews: some View {
		SellersView()
	}
}
