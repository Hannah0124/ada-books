ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/autorun'
require "minitest/reporters"  # for Colorized output
#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # def perform_login(user = nil) 
  #   user ||= User.first 

  #   user_hash = {
  #     user: {
  #       username: user.username,
  #     },
  #   }

  #   post login_path, params: user_hash 

  #   expect(session[:user_id]).must_equal user.id

  #   return user
  # end

  # Chris's version
  def login(username = "Grace Hopper") 
    # Arrange 
    user_hash = {
      user: {
        username: username
      }
    }

    post login_path, params: user_hash 

    user = User.find_by(username: username)
    return user
  end
end
