Pod::Spec.new do |s|

  s.name         = "AMTumblrHUD"
  s.version      = "1.0"
  s.summary      = "Progress HUD inspired by Tumblr app"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }  
  s.author       = { "Askar Mustafin" => "amustafin@crystalspring.kz" }
  s.homepage     = 'https://github.com/Asich/AMTumblrHud'

  s.platform     =  :ios, '5.0'
  s.source       =  { :git => 'https://github.com/Asich/AMTumblrHud.git', :tag => "v1.0" }
  s.source_files = 'AMTumblrHud/AMTumblrHud/AMTumblrHud.{h,m}'
  s.requires_arc = true

end
