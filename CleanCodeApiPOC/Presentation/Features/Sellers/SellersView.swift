//
//  SellersView.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import SwiftUI
import Api
import Domain

struct SellersView: View {
	@StateObject private var sellersVm = SellersViewModel(
		repository: SellerRepositoryDefault(service: SellerService())
	)

	var body: some View {
		if sellersVm.sellers.isEmpty {
			Text("Empty list")
		} else {
			List(sellersVm.sellers) {  seller in
				VStack(alignment: .leading, spacing: 5) {
					Text(seller.name)
					Text(seller.description)
					Text(String(seller.coordinate.latitude))
					Text(String(seller.coordinate.longitude))
				}
			}
		}
	}
}

struct SellersView_Previews: PreviewProvider {
	static var previews: some View {
		SellersView()
	}
}
