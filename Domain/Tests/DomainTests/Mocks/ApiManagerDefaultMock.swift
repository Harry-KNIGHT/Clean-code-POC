//
//  ApiManagerDefaultMock.swift
//  
//
//  Created by Elliot Knight on 09/09/2023.
//

import Foundation
import Api

final class ApiManagerDefaultMock: ApiManager {
	func sendRequest<T>(url: URL?, responseModel: T.Type) async throws -> T where T: Decodable {
		guard let url else {
			throw ServiceError.invalidUrl
		}

		let data = try Data(contentsOf: url)

		do {
			let sellers = try JSONDecoder().decode(responseModel, from: data)
			return sellers
		} catch {
			throw ServiceError.unknown
		}
	}
}