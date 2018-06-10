# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "Post peep:" do
  scenario "User can post a peep on the homepage." do
    visit('/')
    fill_in('user', with: "Angus Pettifer")
    fill_in('peep', with: "My first user peep")
    click_button "Submit"
    expect(page).to have_content "Angus Pettifer, My first user peep"
  end
end
