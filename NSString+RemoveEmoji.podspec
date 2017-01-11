Pod::Spec.new do |s|
  s.name         = 'NSString+RemoveEmoji'
  s.version      = '1.0.1'
  s.summary      = 'A category that extends for detecting and removing Emoji.'
  s.homepage     = 'https://github.com/woxtu/NSString-RemoveEmoji'
  s.license      = { :type => 'MIT', :file => 'LICENSE-MIT' }
  s.author       = { 'woxtu' => 'woxtup@gmail.com' }
  s.osx.deployment_target = '10.10'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/woxtu/NSString-RemoveEmoji.git", :tag => s.version }
  s.source_files = 'Sources/*.swift'
  s.requires_arc = true
end
