Pod::Spec.new do |s|

  s.name         = "AutoCellHeight"
  s.version      = "0.0.2"
  s.summary      = "AutoCellHeight"
  s.homepage     = "https://github.com/andytong1991/AutoCellHeight"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "andy" => "15631134500@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/andytong1991/AutoCellHeight.git", :tag => "0.0.2" }
  s.source_files  = "YTAutoCellHeightTool", "YTAutoCellHeightTool/**/*.{h,m}"
  s.framework  = "UIKit"
  
end
