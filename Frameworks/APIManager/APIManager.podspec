#
# Be sure to run `pod lib lint APIManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'APIManager'
  s.version          = '0.1.0'
  s.summary          = 'Rest API.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  "Framework use for rest Api and get json data from server. Designed by Tung Vu Thien."
                       DESC

  s.homepage         = 'https://github.com/thientung-243/APIManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'thientung-243' => 'thientung.243@gmail.com' }
  s.source           = { :git => 'https://github.com/thientung-243/APIManager.git', :tag => s.version.to_s }
   s.social_media_url = 'https://www.facebook.com/thientung.243/'

  s.ios.deployment_target = '12.0'
  s.swift_version = '4.2'

  s.source_files = 'APIManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'APIManager' => ['APIManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Alamofire', '4.9.1'
   s.dependency 'SwiftyJSON'
   s.dependency 'AlamofireNetworkActivityIndicator'
end
