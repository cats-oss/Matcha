Pod::Spec.new do |s|
  s.name             = 'MatchaTea'
  s.version          = '0.3.0'
  s.swift_version    = '5.0'
  s.summary          = 'Matcha is Framework that can get parameters from URL Path.'
  s.homepage         = 'https://github.com/cats-oss/Matcha'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kyohei Ito' => 'ito_kyohei@cyberagent.co.jp' }
  s.source           = { :git => 'https://github.com/cats-oss/Matcha.git', :tag => s.version.to_s }
  s.ios.deployment_target       = '8.0'
  s.tvos.deployment_target      = '9.0'
  s.osx.deployment_target       = '10.10'
  s.watchos.deployment_target   = '2.0'
  s.source_files     = 'Matcha/**/*.{h,swift}'
  s.module_name = 'Matcha'
  s.requires_arc     = true
end
