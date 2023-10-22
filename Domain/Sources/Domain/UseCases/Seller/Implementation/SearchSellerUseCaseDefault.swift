//
//  SearchSellerUseCaseDefault.swift
//
//
//  Created by Elliot Knight on 22/10/2023.
//

import Foundation

final class SearchSellerUseCaseDefault: SearchSellerUseCase {
	func searchSeller(keyword sellerName: String, sellers: [SellerBusiness]) -> [SellerBusiness] {
		let filteredSellers = sellers.filter { $0.name.contains(sellerName) }
		return filteredSellers
	}
}
