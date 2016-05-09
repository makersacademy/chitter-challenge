feature 'User signs out' do

  before(:each) do
    User.create(name: 'elia',
      username: 'elia-uk',
      email: 'elia@gmail.com',
    password: 'Obp23',
     password_confirmation: 'Obp23')
  end

  scenario 'while being signed in' do
    sign_in(email: 'elia@gmail.com', password: 'Obp23')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, elia@gmail.com')
  end
end
