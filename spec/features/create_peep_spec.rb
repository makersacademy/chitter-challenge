# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature "posting a message" do
  scenario "a user posts a message to Chitter" do
    new_user_sign_up
    fill_in('peep', with: 'Hello World')
    click_button('Post Peep')

    expect(page).to have_content("Hello World")
  end

  scenario "cannot post a peep if not logged in" do
    visit "/"
    expect(page).to_not have_content("Post Peep")
  end

end
