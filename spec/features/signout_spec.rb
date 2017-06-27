feature 'Sign Out' do
  before(:each) do
    User.create(email: 'john@doe.com',
    username: 'johndoe',
    password: 'password',
    password_confirmation: 'password')
  end

  scenario 'while being signed in' do
    sign_in(email: 'john@doe.com', username: 'johndoe', password: 'password')
    click_button 'Sign Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, john@doe.com')
  end
end
