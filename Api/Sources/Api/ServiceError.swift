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

extension ServiceError {
	var localizedDescription: String {
		switch self {
		case .invalidUrl:
			return "Invalid url"
		case .invalidHttpResponse:
			return "Invalid http response"
		case .invalidDecoding:
			return "Can't decode"
		case .unautorized:
			return "You are unautorized"
		case .serverError(let code):
			return "Server returns an error: \(code)"
		case .unknown:
			return "Something when wrong, try again"
		}
	}
}
