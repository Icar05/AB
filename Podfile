# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ABProject' do
  # PodFile
  use_frameworks!

  # Pods for ABProject

    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
    pod 'Alamofire',  '~> 4.7'
    # pod 'AlamofireObjectMapper', '~> 5.2'

post_install do |installer| installer.pods_project.build_configurations.each do |config| config.build_settings.delete('CODE_SIGNING_ALLOWED') config.build_settings.delete('CODE_SIGNING_REQUIRED') end end 

end
