Given(/^a user is on the "([^"]*)" page$/) do |page|
  visit page
end

Then(/^they click on the "([^"]*)" hyperlink$/) do |hyperlink|
  click_on hyperlink
end

Then(/^they see "([^"]*)"$/) do |phrase|
  expect(page).to have_content phrase
end

When(/^they fill in "([^"]*)" as the "([^"]*)"$/) do |input, field|
  fill_in field, with: input
end

When(/^they press the "([^"]*)" button$/) do |button|
  click_button button
end
