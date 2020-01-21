feature 'users can sign up to chitter' do
  scenario 'user signing up' do
    visit '/users/new'
    fill_in :username, with: "user1"
    fill_in :email, with: "user@me.com"
    fill_in :password, with: "password123"
    click_button 'Submit'
    expect(page).to have_content "Welcome, user1!"
  end
end
