//
//  SellerService.swift
//
//
//  Created by Elliot Knight on 14/10/2023.
//

import Foundation

public protocol SellerService {
	/// Retrieves seller data asynchronously.
	///
	/// - Returns: An array of `SellerData` objects.
	/// - Throws: A `ServiceError` if an error occurs during data retrieval. Possible
	///   error scenarios include incorrect URL and JSON decoding errors.
	/// - Note: This method reads seller data from a JSON file associated with the
	///   chosen mock scenario. It can simulate errors if the JSON file format is
	///   incorrect or if the file is missing.
	func getSellers() async throws -> [SellerData]
}
