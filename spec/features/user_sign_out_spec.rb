
feature 'User signing out' do

  before(:each) do
    User.create(name: 'Sean', email: 's@s.com', password: 'password', password_confirmation: 'password')
  end

  xscenario 'a signed-in user signing out' do
    sign_in(email: 's@s.com', password: 'password')
    click_button('Sign Out')
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, Sean')
  end

end
