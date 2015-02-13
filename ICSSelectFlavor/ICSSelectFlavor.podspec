Pod::Spec.new do |s|
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.name         = "ICSSelectFlavor"
  s.version      = "0.0.1"
  s.summary      = "Example CocoaPod that allows the user to select an ice cream flavor"
  s.homepage     = "https://github.com/JRG-Developer/CocoaPodsTutorial"
  s.license      =  { :type => "MIT", :file => "LICENSE" }
  s.authors      =  { "Joshua Greene" => "jrg.developer@gmail.com" }
  s.source       =  { :git => "https://github.com/JRG-Developer/CocoaPodsTutorial.git",
                      :tag => "#{s.version}"}

  s.source_files = 'ICSSelectFlavor/*'
  s.requires_arc = true
  s.framework    =  'UIKit'

  s.dependency =	'Alamofire', '~> 1.1'
  s.dependency =	pod 'MBProgressHUD', '~> 0.9'

end
