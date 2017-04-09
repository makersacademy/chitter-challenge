feature 'User signs out' do

  before(:each) do
    User.create(email: 'jackdopeyman@hotmail.com',
                password: 'password1234',
                password_confirmation: 'password1234')
  end

  scenario 'while being signed in' do
    sign_in(email: 'jackdopeyman@hotmail.com', password: 'password1234')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, jackdopeyman@hotmail.com')
  end

end
