//
//  BaseApi.swift
//
//
//  Created by Elliot Knight on 09/09/2023.
//

import Foundation

/**
 `BaseApi` is a Swift class for making asynchronous network requests using the `async/await` concurrency model.

 It provides a generic method `sendRequest` to send HTTP requests and  decode the response
 into a specified model conforming to `Decodable`.

 - Note: Ensure that your `responseModel` conforms to the `Decodable` protocol to allow for successful JSON decoding.

 ### Usage Example

 ```swift
 let api = BaseApi()
 let url = URL(string: "https://example.com/api/data")
 do {
	 let responseModel = try await api.sendRequest(url: url, responseModel: YourDecodableModel.self)
	 // Handle the responseModel
 } catch {
	 // Handle any errors that may occur during the request
 }
**/
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
