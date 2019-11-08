
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "post peeps" do
  scenario "user can connect to the page, see all peeps, and add some" do
    visit "/"
    expect(page).to have_content("Chitter:")
  end
end
