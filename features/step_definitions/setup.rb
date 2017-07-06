Given(/^the environment variable (.*) is set to "(.*)"$/) do |key, value|
  ENV[key] = value
end
