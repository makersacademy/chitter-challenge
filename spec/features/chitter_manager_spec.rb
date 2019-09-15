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
      expect(page).to have_content time_new
      expect(page).to have_content 'tony_smith'
    end
  end
end

feature 'Sign up for chitter' do
  scenario 'Sign up for chitter successfully' do
    truncate_table
    visit '/'
    add_a_user('tomysmith@gmail.com')
    expect(page).to have_content 'You have signed up for chitter!'
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
    add_a_user('tomysmith@gmail.com')   
    expect(page).to have_content 'That user already exists - please choose a different name!'
  end


end