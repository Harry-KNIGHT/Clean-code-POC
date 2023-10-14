//
//  SellersViewModel.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import Foundation
import Domain

/// The `SellersViewModel` class acts as a view model for sellers' data, providing a way to interact with and display
/// sellers' information in a SwiftUI view.
///
/// The view model fetches sellers' data from a provided `SellerRepository` asynchronously and makes it available
/// through the `sellers` property, which is marked as `@Published` to enable SwiftUI's data binding.
final class SellersViewModel: ObservableObject {
	@Published public var sellers: [Seller] = []
	private let repository: SellerRepository

	init(repository: SellerRepository) {
		self.repository = repository

		// It will fetch data only on simulator or real device for the moment
		Task {
			await getSellers()
		}
	}

	/// Asynchronously fetches sellers' data from the repository and updates the `sellers` property accordingly.
	@MainActor
	func getSellers() async {
		do {
			let sellers =  try await repository.getSellers()
			self.sellers = sellers.map { Seller(data: $0) }
		} catch {
			self.sellers = []
		}
	}
}
