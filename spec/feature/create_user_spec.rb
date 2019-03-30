# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Create user' do

  scenario 'user can sign up' do

    visit '/'
    click_button 'signup'
    
    fill_in "name",	with: "TEST" 
    fill_in "username",	with: "My username" 
    fill_in "email",	with: "email@gmail.com" 
    fill_in "password",	with: "12345678" 

    click_button 'Submit'

    expect(page).to have_content 'Welcome My username'

  end

end