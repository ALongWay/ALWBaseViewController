Pod::Spec.new do |s|
  s.name             = 'ALWBaseViewController'
  s.version          = '0.1.0'
  s.summary          = 'Provide a base viewController to control statusBar and navigationBar, a category for pop gesture.'
  s.homepage         = 'https://github.com/ALongWay/ALWBaseViewController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lisong' => '370381830@qq.com' }
  s.source           = { :git => 'https://github.com/ALongWay/ALWBaseViewController.git', :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.subspec 'ViewController' do |vc|
    vc.source_files = 'ALWBaseViewController/Classes/ViewController/**/*'
  end

  s.subspec 'PopGesture' do |pg|
    pg.source_files = 'ALWBaseViewController/Classes/PopGesture/**/*'
  end
end
