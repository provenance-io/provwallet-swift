Pod::Spec.new do |spec|

  spec.name         = "ProvWallet"
  spec.version      = "0.0.8"
  spec.summary      = "Provenance Wallet and Client Library for Swift"

  spec.swift_versions = "5.4"

  spec.description  = <<-DESC
      provwallet-swift is a Swift framework to connect to the Provenance blockchain and create and utilize HD wallet (Hierarchical Deterministic Wallets) in apps using the Provenance blockchain.

      Features:
      Provenance compliant HD Wallet
      BIP44 coin type 505
      Mnemonic recovery phrase in BIP39
      BIP32 import and export
      Sign Provenance transactions
      Connect to the Provenance blockchain
                   DESC

  spec.homepage     = "https://github.com/provenance-io/provwallet-swift"

  spec.license      = "Apache License, Version 2.0"

  spec.author             = { "Jason Davidson" => "jason@cucreek.co" }

  spec.ios.deployment_target  = '13.0'

  spec.source       = { :git => "https://github.com/provenance-io/provwallet-swift.git", :tag => "v#{spec.version}" }

  spec.source_files  = "provwallet-swift/**/*.{swift}"

  spec.dependency "secp256k1.swift", "~> 0.1.4"
  spec.dependency "CryptoSwift", "~> 1.4.0"
  spec.dependency "SwiftProtobuf", "~> 1.18.0"
  spec.dependency "gRPC-Swift", "~> 1.4.0"
  spec.dependency "gRPC-Swift-Plugins", "~> 1.4.0"

  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
