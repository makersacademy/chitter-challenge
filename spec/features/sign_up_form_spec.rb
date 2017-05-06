feature 'Sign Up Form' do

  scenario 'User can enter details into the sign up form' do
    visit('/signup')
    fill_in('Name', :with => 'Tim Hawkins')
    fill_in('Username', :with => 'therealtimhawkins')
    fill_in('Email', :with => 'timhawkins@gmail.com')
    fill_in('Password', :with => 'cliveallen')
    click_button 'Submit Details'

    expect(page).to have_content 'Welcome to Chitter Tim!'
  end
end
