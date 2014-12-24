Pod::Spec.new do |s|
  s.name         = "XHTwitterPaggingViewer"
  s.version      = "0.5"
  s.summary      = "A twitter like navigation bar, page viewer."
  s.homepage     = "https://github.com/xhzengAIB/TwitterPaggingViewer"
  s.license      = "MIT"
  s.authors      = { "Jack" => "xhzengAIB@gmail.com" }
  s.source       = { :git => "https://github.com/xhzengAIB/TwitterPaggingViewer.git", :tag => "v0.5" }
  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'
  s.platform     = :ios, '6.0'
  s.source_files = 'XHTwitterPaggingViewer/*/*.{h,m}'
  s.source_resources = 'XHTwitterPaggingViewer/Assets'
  s.requires_arc = true
end
