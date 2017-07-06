def model_class(model)
  model.singularize.titleize.constantize
end

Then(/^there should be (\d+) ([a-z\s_]*)s?$/) do |count, model|
  expect(model_class(model).count).to eq(count.to_i)
end

Then(/^the ([a-z]*) ([a-z\s_]*) should have ([a-z\s_]*): (.*)$/) do |pointer, model, key, value|
  expect(model_class(model).send(pointer).send(key).to_s).to eq(value)
end
