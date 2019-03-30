# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature "Posting peeps" do
  scenario "a user can add message to form" do
    visit "/peeps/new"
    expect(page).to have_selector "form"
  end

  scenario "a user can post a peep to Chitter" do
    visit "/peeps/new"
    fill_in "message", :with => "Writing a Chitter app!"
    click_button "Post"
    expect(page).to have_content "Writing a Chitter app!"
  end
end