feature 'User signs out' do

  before(:each) do
    User.create(email: 'newuser@gmail.com',
                password: 'password123',
                password_confirmation: 'password123',
                username: 'newnew',
                name: 'mew')
  end

  scenario 'while being signed in' do
    sign_in(email: 'newuser@gmail.com', password: 'password123')
    click_button 'Sign out'
    expect(page).to have_content('You have signed out!')
    expect(page).not_to have_content('Welcome, newuser@gmail.com')
  end

end
