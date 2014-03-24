Pod::Spec.new do |s|
  s.name     = 'TWLEncoder'
  s.version  = '0.9.0'
  s.license  = 'MIT'
  s.summary  = 'An iPhone and OS X libary for creating MP2 files with TwoLAME'
  s.homepage = 'https://github.com/PRX/TWLEncoder'
  s.social_media_url = 'https://twitter.com/prx'
  s.authors  = { 'Chris Kalafarski' => 'chris.kalafarski@prx.org' }
  s.source   = { :git => 'https://github.com/PRX/TWLEncoder.git', :tag => "0.9.0", :submodules => true }
  s.requires_arc = true

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'
end
