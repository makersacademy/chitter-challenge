require_relative './web_helper.rb'

feature 'signing up' do
  scenario 'signing up creates a user in the users database' do
    visit '/'
    sign_up_and_submit
    expect(User.first.email).to eq 'test_email'
    expect(User.first.password).to eq 'password'
    expect(User.first.name).to eq 'Kane'
    expect(User.first.username).to eq 'username_test'
  end

  scenario 'signing up returns confirmation' do
    visit '/'
    sign_up_and_submit
    expect(User.first.email).to eq 'test_email'
    expect(User.first.password).to eq 'password'
    expect(User.first.name).to eq 'Kane'
    expect(User.first.username).to eq 'username_test'
    expect(page).to have_content('Account successfully created')
  end

  scenario 'if the email/username is not unique show error' do
    visit '/'
    sign_up_and_submit
    click_button 'Sign up'
    fill_in 'email', with: 'test_email' 
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'Kane'
    fill_in 'username', with: 'username_test2'
    click_button 'Submit'
    expect(page).to have_content('The email or username is already in use please try another')
  end
end
