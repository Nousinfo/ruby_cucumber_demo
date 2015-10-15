class Screenshot
  def self.capture_screenshot(scenario)
    return nil unless scenario
    Dir::mkdir('screenshots') unless File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime('%Y%m%dT%H%M%S')}.png"
    $driver.save_screenshot(screenshot)
    # embed screenshot, 'image/png'
    return get_screenshot_path(screenshot)
  end

  def self.get_screenshot_path(screenshot)
    present_dir = Record.present_directory_path
    screenshot_name = Record.file_name(screenshot,'')
    return "#{present_dir}/screenshots/#{screenshot_name}"
  end
end
