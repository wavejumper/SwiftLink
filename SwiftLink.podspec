Pod::Spec.new do |s|
  dir = File.expand_path File.dirname(__FILE__)

  s.name         = "SwiftLink"
  s.version      = "1.0.0"
  s.summary      = "SwiftLink"
  s.description  = <<-DESC
  Swift bindings to Ableton Link
                   DESC
  s.homepage     = "https://github.com/wavejumper/SwiftLink"
  s.license      = "GNU General Public License"
  s.author       = { "author" => "crowley@kibu.com.au" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/wavejumper/SwiftLink.git", :tag => "master" }
  s.source_files  = "SwiftLink/**"
  s.requires_arc = true
  s.xcconfig  =  { 'LIBRARY_SEARCH_PATHS' => dir + "/link/include " + dir + "/link/modules/asio-standalone/asio/include",
                   'HEADER_SEARCH_PATHS' => dir + "/link/include " + dir + "/link/modules/asio-standalone/asio/include" }
  s.prefix_header_contents = "#define LINK_PLATFORM_MACOSX 1"
end
