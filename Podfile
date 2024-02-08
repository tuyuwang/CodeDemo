# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CodeDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CodeDemo
  pod 'Masonry'
  pod 'SDWebImage', '5.15.8'
  pod 'YYModel'
  pod 'YYText'
  
  target 'CodeDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CodeDemoUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "11.0";
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
