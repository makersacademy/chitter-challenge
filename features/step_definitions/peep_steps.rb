When(/^I write a peep "([^"]*)"$/) do |arg1|
  fill_in('post_peep', with: arg1)
end

Then(/^the number of peeps in the db should increase by (\d+)$/) do |arg1|
  expect(Peep.count).to eq arg1.to_i
end

