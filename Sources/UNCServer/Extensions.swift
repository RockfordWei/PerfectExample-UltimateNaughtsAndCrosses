//
//  Extensions.swift
//  Ultimate Noughts & Crosses Server
//
//  Created by Kyle Jessup on 2016-04-24.
//  Copyright © 2016 PerfectlySoft. All rights reserved.
//

import PerfectLib
import PerfectHTTP
import UNCShared

extension HTTPResponse {
	func badRequest(msg: String) {
		self.status = .badRequest
        self.appendBody(string: msg)
	}
	
	var playerId: Int? {
		get {
			return self.request.playerId
		}
		set {
			let expiresIn = newValue == nil ? -500 : 2000000000
			let cookie = HTTPCookie(name: playerIdCookieName, value: String(newValue ?? 0),
			                        domain: nil, expires: .relativeSeconds(expiresIn),
			                        path: "/", secure: false, httpOnly: false)
			self.addCookie(cookie)
		}
	}
}

extension HTTPRequest {
	var playerId: Int? {
		for (name, value) in self.cookies {
			if name == playerIdCookieName {
				if let playerId = Int(value) {
					return playerId
				}
			}
		}
		return nil
	}
}

