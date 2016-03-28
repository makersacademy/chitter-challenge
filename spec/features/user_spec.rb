feature 'users' do
  scenario 'sign up as new user' do
    visit '/user/new'
    fill_in :name, with: 'John'
    fill_in :username, with: 'JohnDude'
    fill_in :email, with: 'john@john.com'
    fill_in :password, with: 'J0hn123!'
    click_button 'Start Peeping!'
    expect(User.count).to change_by 1
    expect(page).to have_content 'Welcome JohnDude'
    expect(page_path).to be '/'
  end

  xscenario 'don\'t allow multiple sign ups for same mail' do

  end

  xscenario 'sign out' do

  end
end
