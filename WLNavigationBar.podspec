
Pod::Spec.new do |spec|
  spec.name         = "WLNavigationBar"
  spec.version      = "0.0.3"
  spec.summary      = "自定义导航栏"
  spec.description  = "自定义的导航栏组件，支持左右以及标题item的增加删除及更新，支持所有item的自定义及事件，支持所有item的透明度变化和颜色变化，支持导航栏背景色的变化等"
  spec.homepage     = "https://github.com/weilLove/WLCustomNavigationBar"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "weilLove" => "weil218@163.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/weilLove/WLCustomNavigationBar.git", :tag => "#{spec.version}" }
  spec.frameworks = "UIKit"
  spec.subspec 'Core'  do |core|
        core.source_files = "WLNavigationBar/Core/**/*.{h,m}"
  end
end
