Pod::Spec.new do |s|
 s.name = 'AttributedTextView'
 s.version = '0.1.0'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Easiest way to create an attributed UITextView with support for multiple links'
 s.homepage = 'http://evict.nl'
 s.social_media_url = 'https://twitter.com/evermeer'
 s.authors = { "Edwin Vermeer" => "edwin@evict.nl" }
 s.source = { :git => "https://github.com/evermeer/AttributedTextView.git", :tag => "v"+s.version.to_s }
 s.platforms     = { :ios => "8.0", :osx => "10.10", :tvos => "10.0", :watchos => "2.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/*.swift"
     ss.ios.frameworks = "Foundation", "UIKit"
     ss.osx.frameworks = "Foundation", "UIKit"
 end

end
