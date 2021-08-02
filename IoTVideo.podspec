#
# Be sure to run `pod lib lint IoTVideo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name          = 'IoTVideo'
  spec.version       = '1.4.206f.beta'
  spec.summary       = "IoTVideo SDK for iOS"
  spec.description   = "IoTVideo(Internet of Things Video) SDK for iOS"
  spec.homepage      = "https://github.com/GWTimes/IoTVideoSDK-iOS"
  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "JonorZhang" => "zyx1507@163.com" }

  spec.platform      = :ios, "9.0"
  spec.requires_arc  = true
  spec.source        = { :git => "https://github.com/GWTimes/IoTVideoSDK-iOS.git", :tag => "#{spec.version}" }
  spec.libraries     = 'c++','z','bz2','iconv'
  spec.frameworks    = 'AudioToolbox','VideoToolbox','CoreMedia'
  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

  spec.default_subspecs = ['IoTVideo', 'IVVAS']

  spec.subspec 'libp2p' do |ss|
    ss.vendored_libraries = 'Frameworks/P2P/libiot_video_p2p.a'
  end

  spec.subspec 'IoTVideo' do |ss| 
    ss.dependency 'IoTVideo/libp2p'
    ss.dependency 'libFFmpeg-SSL-iOS', '~> 3.4'
    ss.vendored_frameworks = 'Frameworks/IoTVideo.framework'
  end

  spec.subspec 'IVVAS' do |ss| 
    ss.dependency 'IoTVideo/IoTVideo'
    ss.vendored_frameworks = 'Frameworks/IVVAS.framework'
  end
end
