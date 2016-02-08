Pod::Spec.new do |s|
  s.name         = 'AMTumblrHud'
  s.version      = '1.0.0'
  s.license      =  { :type => 'MIT', :file => 'LICENSE' }
  s.authors      =  { 'Askar Mustafin' => 'mustafinaskar@gmail.com' }
  s.summary      = 'Progress HUD inspired by Tumblr app'
  s.homepage     = 'https://github.com/Asich/AMTumblrHud'

# Source Info
  s.platform     =  :ios, '7.1'
  s.source       =  { :git => 'https://github.com/Asich/AMTumblrHud.git', :tag => "#{s.version}" }
  s.source_files = 'AMTumblrHud/AMTumblrHud.{h,m}'
  s.requires_arc = true
end