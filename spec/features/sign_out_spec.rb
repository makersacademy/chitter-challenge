feature 'User signs out' do

  before(:each) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234',
                name: 'Jonathan Gardiner',
                username: 'jelgar')
  end

  scenario 'while being signed in' do
    sign_in(email: 'user@example.com', password: 'secret1234')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
