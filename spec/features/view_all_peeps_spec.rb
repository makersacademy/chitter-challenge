require File.join(File.dirname(__FILE__), '..', 'test_database_helpers.rb')
feature 'View all peeps' do
  scenario 'view all peeps when not logged in' do
    build_peep
    visit '/chitter/peep/all'
    expect(page).to have_content 'This is a peep created by the test database helper' and 'This is a second peep created by the test database helper'
    expect(page).not_to have_button('back to homepage')
    expect(page).to have_button('back to mainpage')
  end

  scenario 'view all peeps when logged in' do
    build_maker
    build_peep
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!' and 'OR'
    expect(page).to have_button('View all Peeps')
    expect(page).to have_button('Signup')
    expect(page).to have_button('Login')
    expect(page).to have_content "to post a peep!"
    click_button 'Login'
    expect(current_path).to eq '/chitter/login'
    fill_in :email, with: 'joebloggs@gmail.com'
    fill_in :password, with: 'password'
    click_button 'Submit'
    expect(page).to have_button('view all peeps')
    expect(page).to have_button('create a peep')
    expect(page).to have_content 'Welcome to Chitter Joe Bloggs' and 'What would you like to do?'
    expect(current_path).to eq '/chitter/maker/homepage'
    click_button('view all peeps')
    expect(page).to have_content 'This is a peep created by the test database helper' and 'This is a second peep created by the test database helper'
    expect(page).to have_button('back to homepage')
    expect(page).not_to have_button('back to mainpage')

  end
end
