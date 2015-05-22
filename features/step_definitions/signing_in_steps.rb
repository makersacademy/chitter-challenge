Given(/^I have a Chitter profile$/) do
  User.create(email: "peter@test",
              name: "Peter Smith",
              username: "Peter",
              password: "test",
              password_confirmation: "test"
                    )
end