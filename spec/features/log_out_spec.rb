feature 'User logs out' do

  before(:each) do
    User.create(
      name: 'sam',
      user_name: 'supersam',
      email: 'user@example.com',
      password: 'secret1234',
      password_confirmation: 'secret1234')
  end

  scenario 'while being signed in' do
    sign_in(email: 'user@example.com', password: 'secret1234')
    click_button 'Log out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
