ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'vcr'

VCR.configure do |config|
  config.ignore_hosts '127.0.0.1', 'localhost'
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
