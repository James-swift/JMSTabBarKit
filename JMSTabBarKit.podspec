Pod::Spec.new do |s|

  s.name          = "JMSTabBarKit"
  s.version       = "1.0.3"
  s.license       = "MIT"
  s.summary       = "A custom tabbar using Swift."
  s.homepage      = "https://github.com/James-swift/JMSTabBarKit"
  s.author        = { "xiaobs" => "1007785739@qq.com" }
  s.source        = { :git => "https://github.com/James-swift/JMSTabBarKit.git", :tag => "1.0.3" }
  s.requires_arc  = true
  s.description   = <<-DESC
                   JMTabBarKit - A custom tabbar using A custom tabbar using Swift.
                   DESC
  s.source_files  = "JMSTabBarKit/*"
  s.platform      = :ios, '8.0'
  s.framework     = 'Foundation', 'UIKit'  

end
