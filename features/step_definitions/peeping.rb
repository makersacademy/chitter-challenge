require 'orderly'

Given(/^I have a Chitter profile$/) do
  User.create(email: "peter@test",
              name: "Peter Smith",
              username: "Peter",
              password: "test",
              password_confirmation: "test"
                    )
end

Given(/^I am logged in$/) do
  visit('/sessions/new')
  fill_in('email', :with => 'peter@test')
  fill_in('password', :with => 'test')
  click_button('Submit')
end

Then(/^I should see time of post/) do
  page.should have_content(Time.now.min)
end

Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |newpeep, oldpeep|
  newpeep.should appear_before(oldpeep)
  oldpeep.should_not appear_before(newpeep)
end

Given(/^have made a post$/) do
  visit('peeps/new')
  fill_in('peep', :with => 'This is a peep')
  click_button('submit')
end