Pod::Spec.new do |s|

  s.name         = "AutoCellHeight"
  s.version      = "1.0.3"
  s.summary      = "AutoCellHeight"
  s.homepage     = "https://github.com/andytong1991/AutoCellHeight"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "andy" => "15631134500@163.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/andytong1991/AutoCellHeight.git", :tag => "1.0.3" }
  s.source_files  = "YTAutoCellHeightTool", "YTAutoCellHeightTool/**/*.{h,m}"
  s.framework  = "UIKit"
  
end
