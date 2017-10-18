#
# Be sure to run `pod lib lint Ject.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Ject'
  s.version          = '1.1.3'
  s.summary          = 'Simple Dependency Injection'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wallflyrepo/Ject'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'superuserdid' => 'jwilliams94.jw@gmail.com' }
  s.source           = { :git => 'https://github.com/wallflyrepo/Ject.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/hyyypower'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Ject/*.swift'
  
  # s.resource_bundles = {
  #   'Ject' => ['Ject/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
