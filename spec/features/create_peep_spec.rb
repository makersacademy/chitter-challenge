feature 'Create peeps' do
  scenario 'Logged in users can view the peep form' do
    sign_in
    expect(page).to have_field("peep_text")
    expect(page).to have_button("Submit peep")
    expect(page).to have_content("Write a peep - 240 characters max!")
  end

  scenario 'If a User creates a peep, they will see it in their feed' do
    # Register test user - no current peeps in feed
    register_user
    sign_in("test", "test123")
    fill_in "peep_text", with: "Chitter is awesome"
    click_button "Submit peep"
    expect(page).to have_content "Chitter is awesome"
    # Already has username, test, on screen but not their name, Test, before peeping
    expect(page).to have_content "Test"
  end
end
