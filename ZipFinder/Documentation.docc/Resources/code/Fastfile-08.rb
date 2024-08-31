fastlane_require 'xcodeproj'

def set_all_xcodeproj_version_numbers(version_number, platform)
    project = Xcodeproj::Project.open('../ZipFinder.xcodeproj')
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
    project.save
end

desc "Updates the app's `MARKETING_VERSION` based on the branch name if needed."
lane :update_version_number_if_needed do
  split_git_ref = ENV["CI_BRANCH"].split("/", -1)
end
