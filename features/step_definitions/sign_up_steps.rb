When(/^I click the "([^"]*)" button$/) do |button_name|
  click_button(button_name)
end

When(/^I click the "([^"]*)" link$/) do |link_id|
  click_link(link_id)
end