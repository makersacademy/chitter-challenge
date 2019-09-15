require_relative '../setup_test_database'
require 'timecop'

feature 'Create a new peep' do
  scenario 'Text, time and the user who wrote the tweet is on screen is shown on the screen' do

    truncate_table
    time_new = Time.new
    Timecop.freeze(time_new) do
      visit '/'
      add_a_user('tomysmith@gmail.com')
      click_button 'Create Peeps'
      fill_in 'text', with: 'This is my first peep'
      click_button 'submit'
      click_button 'View Peeps'
      expect(page).to have_content 'This is my first peep'
      expect(page).to have_content time_new.strftime("%d/%m/%Y %k:%M")
      expect(page).to have_content 'tony_smith'
    end
  end
end

feature 'Sign up for chitter' do
  scenario 'Sign up for chitter successfully' do
    truncate_table
    visit '/'
    add_a_user('tomysmith@gmail.com')
    expect(page).to have_content 'You have signed up for chitter - tony_smith - you can now write your own peeps!'
  end

  scenario 'Sign up for chitter unsuccessfully due to incorrect email' do
    truncate_table
    visit '/'
    add_a_user('invalid_email')   
    expect(page).to have_content 'Please enter a valid email!'
  end

  scenario 'Sign up for chitter unsuccessfully due to uesrname already existing' do
    truncate_table
    visit '/' 
    add_a_user('tomysmith@gmail.com')
    click_button 'Log Out'
    add_a_user('tomysmith@gmail.com')   
    expect(page).to have_content 'That user already exists - please choose a different name!'
  end

end

feature 'Log out of chitter' do
  scenario 'Log out of chitter successfully' do
    truncate_table
    visit '/'
    add_a_user('tomysmith@gmail.com')
    click_button 'Log Out'
    expect(page).to have_content 'You have logged out - tony_smith - have a nice day!'
  end
end

feature 'Log into chitter' do
  scenario 'Log in to chitter successfully' do
    truncate_table
    visit '/'
    add_a_user('tomysmith@gmail.com')
    click_button 'Log Out'
    click_button 'Log In'
    fill_in 'username', with: 'tony_smith'
    fill_in 'password', with: 'password1234'
    click_button 'Submit'
    expect(page).to have_content 'You have logged in - tony_smith - welcome back!'
  end

  scenario 'Fail to log in to Chitter' do
    truncate_table
    visit '/'
    click_button 'Log In'
    fill_in 'username', with: 'tony_smith'
    fill_in 'password', with: 'password1234'
    click_button 'Submit'
    expect(page).to have_content 'Incorrect username/password - Please try again!'
  end

end

