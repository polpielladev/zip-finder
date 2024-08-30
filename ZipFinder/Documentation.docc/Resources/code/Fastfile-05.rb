fastlane_require 'xcodeproj'

def set_all_xcodeproj_version_numbers(version_number, platform)
    project = Xcodeproj::Project.open('../QReate.xcodeproj')
    targets = project.targets
    if platform == "ios"
      targets = targets.select { |target| target.name == "ZipFinder" }
    else
      UI.user_error!("Invalid platform: #{platform}, allowed values are: macos")
    end

    targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings["MARKETING_VERSION"] = version_number
      end
    end
end
