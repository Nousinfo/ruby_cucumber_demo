require 'rubygems'
require 'selenium-cucumber'
require 'pry'
require 'page-object'
require 'spreadsheet'
require 'selenium-webdriver'
# require 'rails'
# require 'rubysl-win32ole'
# require 'win32ole'
require 'rake'
require 'roo'
require 'json'
require "require_all"
require_all 'lib'

# Store command line arguments
include CodeHtml
include XlsReport
include ReportDetails
include Keyword
include Common

$browser_type = ENV['BROWSER'] || $browser || 'ff'
$report_name = ENV['REPORT']
$custom_report = ENV['CUSTOM_REPORT'] || false
$features = []
$excel_test_data = true

SeedData.new()
if $custom_report == 'true'
  $custom_report = true
else
  $custom_report = false
end

# if ENV['HEADLESS'] == 'true'
#   require 'headless'
#
#   headless = Headless.new
#   headless.start
#
#   at_exit do
#     headless.destroy
#   end
# end

begin
  if $custom_report == true
    set_initial_report_with_cucumber if $report_name.nil?
  end
rescue Exception => e
  puts e.message
  Process.exit(0)
end
