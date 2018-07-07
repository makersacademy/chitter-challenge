require_relative './web_helpers.rb'

feature 'Signing up' do
  scenario 'A user can sign up for Chitter' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter Jane Doe'
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
