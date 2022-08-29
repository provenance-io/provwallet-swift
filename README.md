# Provenance Swift Wallet 

`provwallet-swift` is a Swift framework for building [Provenance blockchain](https://github.com/provenance-io/provenance) Swift clients
and transaction signing using Provenance Blockchain-compliant  
([Hierarchical Deterministic Wallets](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)) keys.

## Features
- Provenance compliant HD Wallet
- [BIP44](https://github.com/satoshilabs/slips/blob/master/slip-0044.md) coin type 505  
- Mnemonic recovery phrase in [BIP39](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki)
- BIP32 import and export  
- Sign Provenance transactions
- gRPC client.
    
## Installing via CocoaPods
Add the `ProvWallet` dependency to your CocoaPod pod file:

```
pod 'ProvWallet', '~> 0.0.5'
```

## Roadmap
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

### Proto Generation

See https://github.com/apple/swift-protobuf

Install via Homebrew:
```bash
brew install protobuf
brew install swift-protobuf
```
The `swift-protobuf` formulae does not install the `protoc-gen-grpc-swift`
plugin, only the `protoc-gen-swift` plugin.  Use CocoaPods to download the
Swift `protoc-gen-grpc-swift` binary.  The binary is part of the `gRPC-Swift-Plugins`
pod.

CocoaPods will put the files in `../Pods/gRPC-Swift-Plugins/`.

Copy `../Pods/gRPC-Swift-Plugins/bin/protoc-gen-grpc-swift`
to `protoc-gen-swiftgrpc` at a location on your PATH.

For example:
```
pod install
mkdir -p ~/proto/bin
cp ../Pods/gRPC-Swift-Plugins/bin/protoc-gen-grpc-swift ~/proto/bin/protoc-gen-swiftgrpc          
export PATH=$PATH:~/proto/bin
```

Generate the protos:

```bash
cd Proto
rm -rf ../ProtoGen/*
protoc --swift_opt=FileNaming=PathToUnderscores --swift_out=../ProtoGen \
  --swiftgrpc_opt=FileNaming=PathToUnderscores \
  --swift_opt=Visibility=Public \
  --swiftgrpc_out=Client=true,Server=false:../ProtoGen $(find . -iname "*.proto")  
```
    
## Deploying CocoaPod
                       
The `ProvWallet.podspec` spec defines the CocoaPods pod specification for the
`ProvWallet` CocoaPod. To build and deploy the `provwallet-swift` to the CocoaPods
refer to the CocoaPods guide: https://guides.cocoapods.org/making/getting-setup-with-trunk.html

For example (from the root project directory):

```bash
pod spec lint ProvWallet.podspec
pod trunk register <your email address> '<your name>' --description='<your computer>'
pod trunk push ProvWallet.podspec       
```

## HD Wallet Usage
                                  
Refer to `provwallet-swiftTests` for numerous HD Wallet test cases and examples.

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
          
## Provenance Blockchain Client

### Auth Query Example

Set up a gRPC channel pointing to a Provenance blockchain node,
establish the signing key using Wallet, and submit a query:

```swift
    import GRPC
    import NIO
    import SwiftProtobuf
    import CryptoKit

    let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
    let channel: ClientConnection! = ClientConnection.insecure(group: group)
                              .connect(host: "localhost", port: 9090)

    let auth = AuthQuery(channel: channel) // Provenance Auth module query

    //Set up signing key from mnemonic using Wallet
    let seed = Mnemonic.createSeed(mnemonic: "...mnemonic phrase...")
    let signingKey = PrivateKey(seed: seed, coin: .testnet).defaultKey()
    let address = signingKey.publicKey.address

    //Query base account from Auth module - returns a Promise so 
    //use a blocking .wait() 
    let baseAccount = try auth.baseAccount(address: address).wait()
    
    //Alternative query a base account using Promise when 
    let promise = try auth.baseAccount(address: address) 
    promise.whenSuccess { baseAccount in 
        //...do something with baseAccount...
    }
    promise.whenFailure { error in 
        //...do something with error...
    }
```

### Transfer Coin Example

Set up a gRPC channel pointing to a Provenance blockchain node,
establish the signing key using Wallet, estimate gas, and broadcast
a transaction:

```swift
    import GRPC
    import NIO
    import SwiftProtobuf
    import CryptoKit

    let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
    let channel: ClientConnection! = ClientConnection.insecure(group: group)
                              .connect(host: "localhost", port: 9090)

    let auth = AuthQuery(channel: channel) // Provenance Auth module query

    //Set up signing key from mnemonic using Wallet
    let seed = Mnemonic.createSeed(mnemonic: "...mnemonic phrase...")
    let signingKey = PrivateKey(seed: seed, coin: .testnet).defaultKey()
    let address = signingKey.publicKey.address

    //Query base account from Auth module - returns a Promise so 
    //use a blocking .wait() 
    let baseAccount = try auth.baseAccount(address: address).wait()

    let tx = Tx(signingKey: signingKey, baseAccount: baseAccount, channel: channel)
    
    //Estimate gas
    let gasEstimate = try tx.estimateTx(messages: [bankSend]).wait()

    let bankSend = try Google_Protobuf_Any.from(
            message: Bank.buildMsgSend(
                    fromAddress: baseAccount.address,
                    toAddress: "tp1mpapyn7sgdrrmpx8ed7haprt8m0039gg0nyn8f",
                    amount: "77"))
    
    let txPromise = try tx.broadcastTx(
		    gasEstimate: gasEstimate,
            messages: [bankSend])
    
    txPromise.whenSuccess { response in
        //...do something with response...
    }
    txPromise.whenError { error in 
        //...do something with error...
    }

```
            
### Additional Examples

Refer to the [ProvenanceBlockchainClientTests.swift](./provwallet-swiftTests/ProvenanceBlockchainClientTests.swift) 
test file for examples.
