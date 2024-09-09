platform :ios, '13.0'
inhibit_all_warnings!

def shared_pods
  pod 'Alamofire'
end


target 'Seoudi Weather' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  shared_pods
  # Pods for Seoudi Weather
end 

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end