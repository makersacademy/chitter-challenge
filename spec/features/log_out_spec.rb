feature 'User signs out' do

  before(:each) do
    User.create(name: 'example', username: 'UsernameExample',
                email: 'example@example.com', password: 'password',
                password_confirmation: 'password')
  end

  scenario 'after signing in succesfully' do
    sign_in(email: 'example@example.com', password: 'password')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
