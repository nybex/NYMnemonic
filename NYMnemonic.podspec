Pod::Spec.new do |s|
  s.name         = "NYMnemonic"
  s.version      = "0.0.1"
  s.summary      = "BIP-39 style mnemonic codes."
  s.homepage     = "https://github.com/nybex/NYMnemonic"
  s.license      = 'MIT'
  s.author       = { "Jud Stephenson" => "Jud.Stephenson@gmail.com" }
  s.source       = { :git => "https://github.com/nybex/NYMnemonic.git", :branch => "master" }
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.8'
  s.source_files = '*.{h,m}'
  s.resources    = 'languages/*.txt'
  s.requires_arc = true
end