###User Story 2
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Signing up for a chitter account' do
  scenario 'So a user can post a message, the user can sign up' do

    visit '/'
    click_button 'ENTER CHITTER'
    fill_in :email, with: 'Jessica@me.com'
    fill_in :password, with: '1234'
    click_button 'submit'
    expect(page).to have_content "Welcome back Jessica"

  end
end
