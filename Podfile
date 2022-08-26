project 'provwallet-swift.xcodeproj'

# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
inhibit_all_warnings!

target 'provwallet-swift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for provwallet-swift
  pod 'secp256k1.swift', '~> 0.1.4'
  pod 'CryptoSwift', '~> 1.4.0'
  pod 'SwiftProtobuf', '~> 1.19.1'
  pod 'gRPC-Swift', '~> 1.8.0'
  pod 'gRPC-Swift-Plugins', '~> 1.8.0'

  target 'provwallet-swiftTests' do
    # Pods for testing
    pod 'CryptoSwift', '~> 1.4.0'
    pod 'secp256k1.swift', '~> 0.1.4'
    pod 'SwiftProtobuf', '~> 1.19.1'
    pod 'gRPC-Swift', '~> 1.8.0'
    pod 'gRPC-Swift-Plugins', '~> 1.8.0'
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        config.build_settings["ONLY_ACTIVE_ARCH"] = "YES"
      end
    end
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
