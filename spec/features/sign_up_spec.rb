require './chitter_app.rb'

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up for Chitter' do
  scenario 'a user can sign up' do
    visit('/register/new')
    fill_in('first_name', with: 'Jay')
    fill_in('last_name', with: 'Khan')
    click_button('Register')
    expect(current_path).to eq '/register/confirm'
    expect(page).to have_content 'You have successfully registered'
  end
end
