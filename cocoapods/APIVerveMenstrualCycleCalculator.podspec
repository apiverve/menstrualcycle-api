Pod::Spec.new do |s|
  s.name             = 'APIVerveMenstrualCycleCalculator'
  s.version          = '1.2.3'
  s.summary          = 'Menstrual Cycle Calculator is a period tracker API that predicts future menstrual cycles, fertile windows, and ovulation dates from the...'
  s.description      = <<-'DESC'
Menstrual Cycle Calculator is a period tracker API that predicts future menstrual cycles, fertile windows, and ovulation dates from the last period date and the average cycle and period length.

This iOS/macOS SDK provides a convenient way to access the Menstrual Cycle Calculator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/menstrualcycle?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/menstrualcycle-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveMenstrualCycleCalculator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
