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

	var body: some View {
		Map {
			ForEach(sellersVm.sellers) { seller in
				Marker(seller.name, coordinate: seller.coordinate)
			}
		}
	}
}

struct SellersView_Previews: PreviewProvider {
	static var previews: some View {
		SellersView()
	}
}
