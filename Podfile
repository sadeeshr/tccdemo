# Uncomment the next line to define a global platform for your project
#platform :ios, '8.0'

target 'champcoin_demo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  source 'https://github.com/CocoaPods/Specs.git'
  platform :ios, '8.0'
  use_frameworks!

    pod 'CryptoSwift'
    pod 'Alamofire', '~> 4.4'
    pod 'APESuperHUD', '1.1.2'
    pod 'SwiftIcons', '~> 1.5.1'
    pod 'PasswordTextField'
    pod 'SlideMenuControllerSwift'
    pod 'SwiftyJSON'
    pod 'Material', '~> 2.0'



    plugin 'cocoapods-wholemodule'

swift4pods = ['Material']

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if swift4pods.include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end

end
