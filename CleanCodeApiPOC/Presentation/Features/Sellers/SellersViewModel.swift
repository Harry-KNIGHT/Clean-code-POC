//
//  SellersViewModel.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 14/07/2023.
//

import Foundation
import Domain

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

	@MainActor
	private func getSellers() async {
		do {
			self.sellers = try await repository.getSellers()
		} catch {
			self.sellers = []
		}
	}
}
