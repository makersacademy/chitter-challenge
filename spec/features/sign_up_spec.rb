# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'users can sign up for Chitter' do
  scenario 'user clicks the sign up button and enters their details' do
    visit '/'
    click_button 'Sign up'
    fill_in 'firstname', with: 'Alan'
    fill_in 'surname', with: 'Smith'
    fill_in 'email', with: 'alan.smith@makers-test.com'
    fill_in 'password', with: 'Password1'
    click_button 'Confirm'
    expect(page).to have_content "You've signed up successfully to Chitter... Welcome!"
    expect(page).to have_button "Go back to the Chitter feed"
    expect(User.get(1)).to be_a User
  end
end
