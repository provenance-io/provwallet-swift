# Provenance Swift HD Wallet 

`provwallet-swift` is a Swift framework to create and utilize HD wallet ([Hierarchical Deterministic Wallets](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)) in apps using
the [Provenance blockchain](https://github.com/provenance-io/provenance).

## Features
- Provenance compliant HD Wallet
- [BIP44](https://github.com/satoshilabs/slips/blob/master/slip-0044.md) coin type 505  
- Mnemonic recovery phrase in [BIP39](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki)
- BIP32 import and export  
- Sign Provenance transactions
                              
## Roadmap
- Develop CocoaPods dependency 
- Integrate with iOS/iCloud Keychain
- Utilize Apple CryptoKit over CryptoSwift if secp256k1 is ever available

## Building

This project uses [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html) for
dependency management.  [Installation instructions can be found here](https://guides.cocoapods.org/using/getting-started.html#installation).

Then, in the project directory run:
```bash
$ pod install
````
Next, open `provwallet-swift.xcworkspace` and build as normal.

## Usage
                                  
Refer to `provwallet-swiftTests` for numerous test cases and examples.

### Generate Mnemonic Phrase and Seed
```swift
let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
let mnemonic = Mnemonic.create(entropy: entropy)
print(mnemonic)
// abandon amount liar amount expire adjust cage candy arch gather drum buyer

let seed = Mnemonic.createSeed(mnemonic: mnemonic)
print(seed.toHexString())
```
### Key Derivation (BIP39)

```swift
let mnemonic = Mnemonic.create()
let seed = Mnemonic.createSeed(mnemonic: mnemonic)
let privateKey = PrivateKey(seed: seed, coin: .bitcoin)

// BIP44 key derivation
// m/44'
let purpose = privateKey.derived(at: .hardened(44))

// m/44'/0'
let coinType = purpose.derived(at: .hardened(0))

// m/44'/0'/0'
let account = coinType.derived(at: .hardened(0))

// m/44'/0'/0'/0
let change = account.derived(at: .notHardened(0))

// m/44'/0'/0'/0/0
let firstPrivateKey = change.derived(at: .notHardened(0))
print(firstPrivateKey.publicKey.address)
```

### Create Wallet and Account
```swift
let mnemonic = Mnemonic.create()
let seed = Mnemonic.createSeed(mnemonic: mnemonic)
let network: Network = .main(.bitcoin)
let wallet = Wallet(seed: seed, network: network)
let account = wallet.generateAccount()
print(account)
```

### Import and Export BIP32

#### Import from BIP32
```swift
let wallet = try Wallet.init(bip32Serialized: "xprv9s21ZrQH143K2XojduRLQnU8D8K59KSBoMuQKGx8dW3NBitFDMkYGiJPwZdanjZonM7eXvcEbxwuGf3RdkCyyXjsbHSkwtLnJcsZ9US42Gd")

//yields m/44'/505'/0'/0/0
let account = wallet.generateAccount()

//yields m/44'/505'/0'/0/77'
let account77 = wallet.generateAccountHardened(at: 77)
```
    
#### Export BIP32
```swift
let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
let mnemonic = Mnemonic.create(entropy: entropy)
let seed = Mnemonic.createSeed(mnemonic: mnemonic)
let wallet = Wallet.init(seed: seed, coin: .mainnet)

let bip32 = try wallet.privateKey.serialize(publicKeyOnly: false)
print(bip32)
```

### Signatures

#### With a New Wallet
```swift
let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
let mnemonic = Mnemonic.create(entropy: entropy)
let seed = Mnemonic.createSeed(mnemonic: mnemonic)
let wallet = Wallet.init(seed: seed, coin: .testnet)

//yields m/44'/1'/0'/0/0
let account = wallet.generateAccount()
let signature = try account.privateKey.sign(text: "HELLO")

print(signature.provenanceSignature.toHexString())

let hashData = SHA256.hash(data: "HELLO".data(using: .utf8)!).data

let validSignature = try Crypto.verify(signature, hash: hashData,
                                       publicKey: account.publicKey.uncompressedPublicKey)

print(validSignature)
```

#### From Existing Wallet
```swift
let wallet = try Wallet.init(bip32Serialized: "xprv9s21ZrQH143K2XojduRLQnU8D8K59KSBoMuQKGx8dW3NBitFDMkYGiJPwZdanjZonM7eXvcEbxwuGf3RdkCyyXjsbHSkwtLnJcsZ9US42Gd")

//yields m/44'/505'/0'/0/0
let account = wallet.generateAccount()
let signature = try account.privateKey.sign(text: "HELLO")

print(signature.provenanceSignature.toHexString())
```