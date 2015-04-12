RSpec::Matchers.define :appear_before do |later_content|
    match do |earlier_content|
      begin
        page.body.index(earlier_content) < page.body.index(later_content)
      rescue ArgumentError
        raise "Could not locate later content on page: #{later_content}"
      rescue NoMethodError
        raise "Could not locate earlier content on page: #{earlier_content}"
      end
    end
  end

When(/^I write a peep "([^"]*)"$/) do |arg1|
  fill_in('post_peep', with: arg1)
end

Then(/^the number of peeps in the db should increase by (\d+)$/) do |arg1|
  expect(Peep.count).to eq arg1.to_i
end

Then(/^"([^"]*)" should be before "([^"]*)"$/) do |arg1, arg2|
  arg1.should appear_before(arg2)
end

Then(/^the first peep in the database should be "([^"]*)"$/) do |arg1|
  expect(Peep.first.peep).to eq arg1
end

When /^I am in (.*) browser$/ do |name|
  Capybara.session_name = name
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_link(arg1)
end




