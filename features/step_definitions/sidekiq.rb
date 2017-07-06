def drain_queue(queue)
  queue.titleize.constantize.drain
end

When(/^I should not see an error when I drain the ([a-z_\s]+) queue$/) do |queue|
  expect{
    drain_queue(queue)
  }.not_to raise_error
end

When(/^I should see a "(.*)" error when I drain the ([a-z_\s]+) queue$/) do |error, queue|
  expect{
    drain_queue(queue)
  }.to raise_error(/#{error}/)
end
