feature 'user login' do

  scenario 'an existing user can log in by inputting correct username and password' do
    User.create(email: "michael@bluth.com", name: "Michael Bluth", username: "hermano", password:"abc123")
    visit '/login'
    fill_in('username', with: 'hermano')
    fill_in('password', with: 'abc123')
    click_button('Login')
    visit '/'
    expect(page).to have_content('Welcome, hermano')
  end

end
