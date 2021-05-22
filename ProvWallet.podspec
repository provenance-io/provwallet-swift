Pod::Spec.new do |spec|

  spec.name         = "ProvWallet"
  spec.version      = "0.0.1"
  spec.summary      = "Provenance HD Wallet"

  spec.swift_versions = "5"

  spec.description  = <<-DESC
      provwallet-swift is a Swift framework to create and utilize HD wallet (Hierarchical Deterministic Wallets) in apps using the Provenance blockchain.

      Features:
      Provenance compliant HD Wallet
      BIP44 coin type 505
      Mnemonic recovery phrase in BIP39
      BIP32 import and export
      Sign Provenance transactions
                   DESC

  spec.homepage     = "https://github.com/provenance-io/provwallet-swift"

  spec.license      = "Apache License, Version 2.0"

  spec.author             = { "Jason Davidson" => "jason@cucreek.co" }

  spec.ios.deployment_target  = '14.5'

  spec.source       = { :git => "https://github.com/provenance-io/provwallet-swift.git", :tag => "v#{spec.version}" }

  spec.source_files  = "provwallet-swift/**/*.{swift}"

  spec.dependency "secp256k1.swift", "~> 0.1.4"
  spec.dependency "CryptoSwift", "~> 1.3.8"

end
