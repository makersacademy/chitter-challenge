require_relative 'web_helper'

feature "Creating new posts" do
  scenario "user can create a new post when logged in" do
    user = User.create(name: "Alice", user_name: "alice", email: "alice@example.com", password: "password01")
    log_in
    visit "/peeps/new"
    fill_in "message", with: "Blah blah blah"
    click_button "Peep"

    expect(current_path).to eq "/"
    expect(page).to have_content "Blah blah blah"
    expect(first("[data-test-id='user_name']").text).to include "Alice"
  end
end
