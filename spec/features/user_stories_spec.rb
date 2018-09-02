require_relative './web_helpers.rb'

feature "can post a peep" do
  scenario "can submit a peep" do
    sign_up
    fill_in 'new_peep', with: "This is a post."
    click_button 'Submit'
    expect(page).to have_content("This is a post.")
  end
end

feature "can view peeps" do
  scenario "in reverse chronological order" do
    sign_up
    submit_peep
    fill_in 'new_peep', with: "This is another post."
    click_button 'Submit'

    top_peep = first(".peep_body")
    expect(top_peep).to have_content("This is another post.")
  end
end 

feature "can see when a peep was made" do
  scenario "will display a timestamp" do
    sign_up
    submit_peep
    expect(page).to have_content("Posted at")
  end
end

feature "signup" do
  scenario "user can signup for an account" do
    visit("/users/new")
    fill_in "email", with: "ab@cd.com"
    fill_in "username", with: "Test666"
    fill_in "name", with: "Firstname"
    fill_in "password", with: "123456"
    click_button("Sign-up")

    expect(page).to have_content("Welcome, Firstname")
  end
end
