# frozen_string_literal: true
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'fileutils'
require 'json'
require 'report_builder'
require 'webdrivers'

FileUtils.mkdir_p('reports/json') unless File.exist?('reports/json')

def register_driver
  Capybara.register_driver :firefox do |app|
    options = Selenium::WebDriver::Firefox::Options.new
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  end
  Capybara.default_driver = :firefox
  Capybara.javascript_driver = :firefox
  Capybara.app_host = 'http://computer-database.herokuapp.com/computers'
end

