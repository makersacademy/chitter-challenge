require_relative 'web_helper'

feature "Logging in" do
  scenario "A user with an account can log in" do
    User.create(name: "Alice", user_name: "alice", email: "alice@example.com", password: "password01")
    log_in

    expect(page).to have_content("Hello Alice")
  end
end
