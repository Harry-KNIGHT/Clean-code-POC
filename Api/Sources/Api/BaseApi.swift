//
//  BaseApi.swift
//
//
//  Created by Elliot Knight on 09/09/2023.
//

import Foundation

public class BaseApi {
	func sendRequest<T: Decodable>(url: URL?, responseModel: T.Type) async throws -> T {
		guard let url else {
			throw ServiceError.invalidUrl
		}

		do {
			let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url), delegate: nil)

			guard let response = response as? HTTPURLResponse else {
				throw ServiceError.invalidHttpResponse
			}

			switch response.statusCode {
			case 200...299:
				guard let decodedResponse = try? JSONDecoder().decode(responseModel.self, from: data) else {
					throw ServiceError.invalidDecoding
				}
				return decodedResponse
			case 401:
				throw ServiceError.unautorized
			default:
				throw ServiceError.serverError(code: response.statusCode)
			}
		} catch {
			throw ServiceError.unknown
		}
	}
}
