feature 'Loggin out' do

  before(:each) do
    User.create(name: 'user',
                username: 'userfoo',
                email: 'user@example.com',
                password: 'foobar',
                password_confirmation: 'foobar')
  end

  scenario 'User can log out' do
    sign_in(username: 'userfoo', password: 'foobar')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, userfoo!')
  end

end
