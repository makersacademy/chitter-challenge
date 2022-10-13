feature "Posting a peep" do

  scenario "a user can add peep using the form on the peep page" do
    visit "/peeps/new"
    expect(page).to have_selector "form"
  end

# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

  scenario "a user can post a peep to Chitter" do
    visit "/peeps/new"
    fill_in "peep", :with => "Writing a Chitter post!"
    click_button "Post"
    expect(page).to have_content "Writing a Chitter post!"
  end

end
