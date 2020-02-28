#
#  Be sure to run `pod spec lint SteppableSlider.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name            = "SteppableSlider"
  spec.version         = "0.0.8"
  spec.summary         = "A custom UISlider with step for iOS."
  spec.homepage        = "https://github.com/Mildwhale/SteppableSlider"
  spec.license         = { :type => 'MIT', :file => 'LICENSE' }
  spec.author          = { "Kyujin Kim" => "mildwhale@gmail.com" }
  spec.swift_versions  = ['4.0']
  spec.platform        = :ios, "10.0"
  spec.default_subspec = "Core"
  spec.source          = { :git => "https://github.com/Mildwhale/SteppableSlider.git", :tag => "#{spec.version}" }

  spec.subspec "Core" do |ss|
    ss.source_files = "Sources/SteppableSlider/"
    ss.framework    = "UIKit"
  end

  spec.subspec "RxSwift" do |rxspec|
    rxspec.source_files = "Sources/RxSteppableSlider/"
    rxspec.dependency "SteppableSlider/Core"
    rxspec.dependency "RxSwift", "~> 5.0"
    rxspec.dependency "RxCocoa"
  end

end
