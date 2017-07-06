require 'cucumber/rails'
require 'cucumber_factory'
require 'rspec/matchers'
require 'cucumber/api_steps'
require 'sidekiq/testing'
require 'webmock/cucumber'

Sidekiq::Testing.fake!

Cucumber::Factory.add_steps(self)

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
