source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.2'
gem 'puma', '~> 3.7'
gem 'sidekiq', '~> 5.0.4'
gem 'pg'

group :development, :test do
  gem 'pry'
  gem 'cucumber-rails', require: false
  gem 'rspec'
  gem 'factory_girl'
  gem 'cucumber_factory'
  gem 'cucumber-api-steps', require: false
  gem 'database_cleaner'
  gem 'webmock'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end
