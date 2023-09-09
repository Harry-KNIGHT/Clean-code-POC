//
//  ServiceErrors.swift
//  
//
//  Created by Elliot Knight on 29/07/2023.
//

import Foundation

public enum ServiceError: Error, Equatable {
	case invalidUrl
	case invalidHttpResponse
	case invalidDecoding
	case unautorized
	case serverError(code: Int)
	case unknown
}
