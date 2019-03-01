require './lib/user.rb'

feature 'register' do
  scenario 'should save new username' do
    visit('/register')

    username = 'simon88'
    password = 'penmousekeys'

    fill_in('username', with: username)
    fill_in('password', with: password)

    click_button 'Submit'

    expect(User.all[0].username).to eq(username)
  end
end