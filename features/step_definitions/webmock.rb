Given(/^I listen for POST requests to "([^"]*)" with body "([^"]*)" and return "([^"]*)"$/) do |url, body, code|
  $webmock_stubs ||= {}
  $webmock_stubs[url] = stub_request(:post, url).with(body: body).to_return(status: code.to_i)
end

Then /^([0-9]+) requests? should have been made to "(.*)"$/ do |count, url|
  expect($webmock_stubs[url]).to have_been_made.times(count.to_i)
end
