describe "Replying to peeps" do
  scenario "a logged in user can reply to another user's peep" do
    create_users
    log_in
    visit("/peeps")

  end
end
