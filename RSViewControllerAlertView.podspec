#
# Be sure to run `pod lib lint RSViewControllerAlertView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RSViewControllerAlertView'
  s.version          = '0.1.4'
  s.summary          = 'Easily design complex custom AlertView in ios.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = 'Seameless designing using interface builder and integrate with RSViewControllerAlert will give you fully custom alert view, with lots of built in animation. It also provide a finer way to integrate your custom animation in it.'

  s.homepage         = 'https://github.com/ratulSharker/RSViewControllerAlertView.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ratul Sharker' => 'sharker.ratul.08@gmail.com' }
  s.source           = { :git => 'https://github.com/ratulSharker/RSViewControllerAlertView.git', :branch => 'master', :tag => 'releaseV0.1.4' }
#  s.social_media_url = 'https://www.linkedin.com/in/ratul-sharker-34a65b25/'

  s.ios.deployment_target = '8.0'

#  s.source_files = 'RSViewControllerAlertView/Classes/**/*'
    s.source_files = 'RSViewControllerAlertView/Classes/**/*.m', 'RSViewControllerAlertView/Classes/**/*.h'
    s.public_header_files = 'RSViewControllerAlertView/Classes/**/*.h'

  # s.resource_bundles = {
  #   'RSViewControllerAlertView' => ['RSViewControllerAlertView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
