Then(/^the peep count should be (\d+)$/) do |total_peeps|
  expect(Peep.count).to eq(total_peeps.to_i)
end