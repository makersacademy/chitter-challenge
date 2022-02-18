# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature "posting a message" do
  scenario "a user posts a message to Chitter" do

    visit_sessions_new_and_sign_in(
      email: 'test@example.com', password: 'password123'
    )
    visit '/peeps'
    fill_in('peep', with: 'Hello World')
    click_button('Post Peep')

    expect(page).to have_content("Hello World")

  end
end
