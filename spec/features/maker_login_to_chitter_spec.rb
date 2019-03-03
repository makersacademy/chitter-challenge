require File.join(File.dirname(__FILE__), '..', 'test_database_helpers.rb')
feature 'Login to Chitter' do
  scenario 'allow a maker to login to Chitter' do
    build_maker
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
  end
end
