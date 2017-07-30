# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "Peeping" do
  scenario "I can post a peep to Chitter" do
    sign_up
    click_button "Post a peep"
    fill_in :peep, with: "My first peep!"
    fill_in :tags, with: "dangermouse"
    click_button "Peep!"
    expect(page).to have_content "My first peep!"
  end
end
