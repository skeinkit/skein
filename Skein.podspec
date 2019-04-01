Pod::Spec.new do |s|
  s.name             = 'Skein'
  s.version          = '0.5.1'
  s.summary          = '🚀👩‍💻'

  s.description      = 'Skein is a set of Swift extensions, utilities and components that aimed to speed up application development.'

  s.homepage         = 'https://github.com/skeinkit/Skein'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rozd' => 'max.rozdobudko@gmail.com' }
  s.source           = { :git => 'https://github.com/skeinkit/Skein.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '4.2'

  s.ios.deployment_target = '8.0'

  s.default_subspec = "Extensions"

  s.subspec 'Extensions' do |ss|

    ss.subspec 'Foundation' do |sss|
      sss.source_files = 'Source/Extensions/Foundation'
    end

    ss.subspec 'UI' do |sss|
      sss.source_files = 'Source/Extensions/UI'
    end

    ss.subspec 'Crypto' do |sss|
      sss.source_files = 'Source/Extensions/Crypto'
    end

    ss.subspec 'ReactiveSwift' do |sss|
      sss.source_files = 'Source/Extensions/ReactiveSwift'

      sss.dependency 'Result'
      sss.dependency 'ReactiveSwift'
    end

  end

end
