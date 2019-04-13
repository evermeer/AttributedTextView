Pod::Spec.new do |s|
 s.name = 'AttributedTextView'
 s.version = '1.4.0'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Easiest way to create an attributed UILabel or UITextView (with support for multiple links and HTML)'
 s.homepage = 'https://github.com/evermeer/AttributedTextView'
 s.social_media_url = 'https://twitter.com/evermeer'
 s.authors = { "Edwin Vermeer" => "edwin@evict.nl" }
 s.source = { :git => "https://github.com/evermeer/AttributedTextView.git", :tag => "v"+s.version.to_s }
 s.platforms     = { :ios => "8.0" }
 s.requires_arc = true
 s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
 s.swift_version = '5.0'
 s.swift_versions = ['4.0', '4.2', '5.0']

 s.frameworks = "Foundation", "UIKit"
 s.source_files  = "Sources/*.swift"
end
