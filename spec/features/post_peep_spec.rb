# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature "Post a message(peep) to chitter." do
  scenario "User can post a peep on the homepage." do
    visit('/')
    fill_in('peep', with: "This is my first peep on chitter!")
    click_button "Submit"
    expect(page).to have_content "This is my first peep on chitter!"
  end
end
