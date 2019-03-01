require './lib/user.rb'

feature 'login' do
  scenario 'should load feed if valid login details submitted' do
    username = 'simon88'
    password = 'penmousekeys'
    User.create(username: username, password: password)
    
    visit('/login')
    
    fill_in('username', with: username)
    fill_in('password', with: password)

    click_button 'Submit'

    expect(page.current_path).to eq '/feed'
  end
end