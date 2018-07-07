require_relative './web_helpers.rb'

feature 'Signing up' do
  scenario 'User can sign up for Chitter' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter Jane Doe'
  end
  scenario 'User gets an error message if username is already taken' do
    # Rakefile already sets up Han Solo as a user
    duplicate_sign_up_username
    expect(page).to have_content 'Username already taken. Please try again'
  end

end

feature 'Posting a peep' do
  scenario 'A user can post a peep' do
    sign_up
    fill_in :peep_input, with: 'A test peep!'
    click_button 'Post Peep'
    expect(page).to have_content 'A test peep!'
  end
end
