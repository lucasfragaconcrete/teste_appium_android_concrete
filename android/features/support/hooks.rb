Before do
  @appium_driver = Appium::Driver.new(opts, true)
  Appium.promote_appium_methods Object
  @settings = YAML.load_file(File.expand_path('../../cucumber.yml', File.dirname(__FILE__)))
  $driver.start_driver
end

After do |scenario|
  if scenario.failed?

    FileUtils.mkdir_p('screenshots') unless File.directory?('screenshots')

    timer_path = Time.now.strftime('%d_%m_%Y').to_s
    screenshot_name = "#{timer_path}_#{scenario.name.gsub(/\s+/, '_').tr('/', '_')}.png"
    screenshot_file = File.join('screenshots', screenshot_name)
    $driver.screenshot(screenshot_file)
    embed("screenshots/#{screenshot_name}", 'image/png')
  end
  $driver.driver_quit
end

AfterConfiguration do
  FileUtils.rm_r('screenshots') if File.directory?('screenshots')
end
