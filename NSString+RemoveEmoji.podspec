Pod::Spec.new do |s|
  s.name         = 'NSString+RemoveEmoji'
  s.version      = '0.2.0'
  s.summary      = 'A category that extends for removing Emoji.'
  s.homepage     = 'https://github.com/woxtu/NSString-RemoveEmoji'
  s.license      = { :type => 'MIT', :file => 'LICENSE-MIT' }
  s.author       = { 'woxtu' => 'woxtup@gmail.com' }
  s.source       = { :git => 'https://github.com/woxtu/NSString-RemoveEmoji.git', :tag => '0.2.0' }
  s.source_files = 'NSString+RemoveEmoji/NSString+RemoveEmoji.{h,m}'
  s.requires_arc = true
  s.framework = 'Foundation'
end
