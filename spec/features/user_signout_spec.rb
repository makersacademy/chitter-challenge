feature 'user_signout' do
  before(:each) do
    User.create(username: 'user1',
                email: 'user1@email.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'signing out ends your session' do
    sign_in(username: 'user1', password: '1234')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).to_not have_content('Welcome user1!')
  end
end
