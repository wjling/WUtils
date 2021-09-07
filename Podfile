
source 'https://github.com/CocoaPods/Specs.git'
# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

project 'WUtils.xcodeproj'
inhibit_all_warnings!

target 'WUtilsDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for WUtilsDemo
  pod 'Kingfisher'
  pod "WUtils", :path => '.'
  
  target 'WUtils' do
    inherit! :search_paths
  end
  
  target 'WUtilsTests' do
    # Pods for testing
    inherit! :search_paths
  end

end
