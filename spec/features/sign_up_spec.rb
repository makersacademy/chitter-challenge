# User Story 1
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Signing up for a chitter account' do
  scenario 'So a user can post a message, the user can sign up' do

    visit '/'
    click_button 'ENTER CHITTER'
    click_button 'sign me up'
    fill_in :first_name, with: 'Jessica'
    fill_in :second_name, with: 'Jones'
    fill_in :handle, with: 'Hannako'
    fill_in :email, with: 'Jessica@me.com'
    click_button 'submit'
    expect{ click_button 'submit'}.to change(User, :count).by(1)
  end
end
