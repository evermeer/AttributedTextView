Pod::Spec.new do |s|
 s.name = 'AttributedTextView'
 s.version = '0.5.0'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Easiest way to create an attributed UITextView with support for multiple links'
 s.homepage = 'https://github.com/evermeer/AttributedTextView'
 s.social_media_url = 'https://twitter.com/evermeer'
 s.authors = { "Edwin Vermeer" => "edwin@evict.nl" }
 s.source = { :git => "https://github.com/evermeer/AttributedTextView.git", :tag => "v"+s.version.to_s }
 s.platforms     = { :ios => "8.0" }
 s.requires_arc = true

 s.frameworks = "Foundation", "UIKit"
 s.source_files  = "Sources/*.swift"
end
