ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require 'mongoid-rspec'

=begin
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
=end

RSpec.configure do |config|
  # Clean up all collections before each spec runs.
  config.before do
    Mongoid.purge!
  end
  config.include Mongoid::Matchers, type: :model
end

