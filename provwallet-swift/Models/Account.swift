//
//  Account.swift
//
//  Created by Pavlo Boiko on 04.07.18.
//
//  Adapted for Provenance on 2021/01/31
//  by jdfigure
//

import Foundation

public struct Account {

    public init(privateKey: PrivateKey) {
        self.privateKey = privateKey
    }

    public let privateKey: PrivateKey

	public var publicKey: PublicKey {
		privateKey.publicKey
	}
	
    public var rawPrivateKey: String {
	    privateKey.get()
    }
	
    public var rawPublicKey: String {
	    privateKey.publicKey.get()
    }

    public var address: String {
	    privateKey.publicKey.address
    }
}
