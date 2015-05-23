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