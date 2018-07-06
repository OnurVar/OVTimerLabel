Pod::Spec.new do |s|
s.name             = 'OVTimerLabel'
s.version          = '1.0.0'
s.summary          = 'Simple Timer Label'
s.description      = <<-DESC
Simple Timer Label which counts up/down for date
DESC
s.homepage         = 'https://github.com/OnurVar/OVTimerLabel.git'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Onur Var' => 'var.onur@hotmail.com' }
s.source           = { :git => 'https://github.com/OnurVar/OVTimerLabel.git', :tag => s.version.to_s }
s.ios.deployment_target = '8.0'
s.source_files = 'OVTimerLabel/Classes/**/*'
end
