feature 'User signs out' do
  before(:each) do
    User.create(email: 'dylan@bossman.com', password: 'bossman', password_confirmation: 'bossman', username: 'dylanrhodius', name: 'dylan rhodius')
  end

  scenario 'While being signed in' do
    sign_in
    click_button 'Sign Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome back, dylanrhodius.')
  end
end
