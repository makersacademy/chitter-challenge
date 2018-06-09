# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "Post peep." do
  scenario "User can post a peep on the homepage." do
    visit('/')
    fill_in('peep', with: "My first peep")
    click_button "Submit"
    expect(page).to have_content "My first peep"
  end
end
