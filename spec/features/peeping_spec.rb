# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "Peeping" do
  scenario "I can post a peep to Chitter" do
    visit('/peeps/new')
    fill_in :peep, with: "My first peep!"
    click_button "Peep!"
    expect(page).to have_content "My first peep!"
  end
end
