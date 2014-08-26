#
#  Be sure to run `pod spec lint YStepperView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html

Pod::Spec.new do |s|
  s.name         = 'YStepperView'
  s.version      = '0.0.1'

  s.summary      = 'Custom Stepper View with visible value change.'

  s.description  = <<-DESC
  YStepperView is custom Stepper View. It is similar to the native Stepper view in iOS but allow user to see the current value of YStepperView.
  DESC

  s.homepage     = 'https://github.com/yuvirajsinh/YStepperView'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = 'yuvirajsinh'
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/yuvirajsinh/YStepperView.git', :tag => 'v0.0.1' }
  s.source_files  = 'YStepperView/*.{h,m}'

  s.frameworks = 'QuartzCore'
  s.requires_arc = true

end
