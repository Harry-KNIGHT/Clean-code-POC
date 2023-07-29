//
//  ServiceErrors.swift
//  
//
//  Created by Elliot Knight on 29/07/2023.
//

import Foundation

enum ServiceErrors: Error {
	case wrongUrl
	case httpResponse
	case decoding
}
