feature 'Sign Up Form' do

  scenario 'User can enter details into the sign up form' do
    visit('/users/new')
    fill_in('name', :with => 'Tim Hawkins')
    fill_in('username', :with => 'therealtimhawkins')
    fill_in('email', :with => 'timhawkins@gmail.com')
    fill_in('password', :with => 'cliveallen')
    click_button 'Submit Details'

    expect(page).to have_content 'Welcome to Chitter Tim Hawkins!'
  end
end
