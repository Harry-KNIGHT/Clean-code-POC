//
//  ServiceErrors.swift
//  CleanCodeApiPOC
//
//  Created by Elliot Knight on 16/07/2023.
//

import Foundation

enum ServiceErrors: Error {
	case wrongUrl
	case httpResponse
	case decoding
}
