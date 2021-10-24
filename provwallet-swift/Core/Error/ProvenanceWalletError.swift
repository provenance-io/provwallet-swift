import Foundation

public enum ProvenanceWalletError: Error {
    public enum CryptoError {
        case failedToEncode(element:Any)
    }

    public enum ContractError: Error {
        case containsInvalidCharactor(Any)
        case invalidDecimalValue(Any)
    }

    public enum ConvertError: Error {
        case failedToConvert(Any)
    }

    case invalidDepth
    case cryptoError(CryptoError)
    case contractError(ContractError)
    case convertError(ConvertError)
    case failedToSign
    case failedToVerify
    case noEnoughSpace
    case unknownError
}
