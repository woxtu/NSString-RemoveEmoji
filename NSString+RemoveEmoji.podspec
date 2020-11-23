Pod::Spec.new do |s|
  s.name         = 'NSString+RemoveEmoji'
  s.version      = '1.2.0'
  s.summary      = 'A category that extends for detecting and removing Emoji.'
  s.homepage     = 'https://github.com/woxtu/NSString-RemoveEmoji'
  s.license      = { :type => 'MIT', :file => 'LICENSE-MIT' }
  s.author       = { 'woxtu' => 'woxtup@gmail.com' }
  s.swift_version = '5.0'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.source       = { :git => "https://github.com/woxtu/NSString-RemoveEmoji.git", :tag => s.version }
  s.source_files = 'Sources/**/*.swift'
end
