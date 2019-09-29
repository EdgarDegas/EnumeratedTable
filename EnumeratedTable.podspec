#
#  Be sure to run `pod spec lint EnumeratedTable.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "EnumeratedTable"
  spec.version      = "1.0.0"
  spec.summary      = "An elegant way to layout a table using Swift enum."
  spec.description  = <<-DESC
  An elegant way to layout a *static* table view using Swift enumeration.
                   DESC

  spec.homepage = "https://github.com/EdgarDegas/ResponsiveButton"
  
  spec.license = "MIT"

  spec.author = { "iMoe" => "iMoeNya@outlook.com" }
  spec.platform = :ios
  spec.platform = :ios, "9.0"

  spec.swift_versions = ['5.1']

  spec.source = { :git => "https://github.com/EdgarDegas/EnumeratedTable.git", :tag => "#{spec.version}" }

  spec.source_files = "Source/**/*"

end
