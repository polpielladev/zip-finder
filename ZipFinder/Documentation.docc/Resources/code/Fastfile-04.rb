fastlane_require 'xcodeproj'

def set_all_xcodeproj_version_numbers(version_number, platform)
    project = Xcodeproj::Project.open('../ZipFinder.xcodeproj')
    targets = project.targets
    if platform == "ios"
      targets = targets.select { |target| target.name == "ZipFinder" }
    else
      UI.user_error!("Invalid platform: #{platform}, allowed values are: macos")
    end
end
