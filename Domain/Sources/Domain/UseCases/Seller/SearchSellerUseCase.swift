//
//  SearchSellerUseCase.swift
//
//
//  Created by Elliot Knight on 22/10/2023.
//

import Foundation

protocol SearchSellerUseCase {
	func searchSeller(keyword sellerName: String, sellers: [SellerBusiness]) -> [SellerBusiness]
}
