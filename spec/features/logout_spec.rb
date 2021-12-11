require 'pg'

feature 'logout function' do
  scenario 'user can log out of Chitter' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])

    visit('/log-in')
    fill_in('email', :with => 'example@gmail.com')
    fill_in('password', :with => '*****')
    click_on('Submit')

    expect(page).to have_content 'Welcome Birdy!'

    click_link('logout')

    expect(page).to have_content 'You have sucessfully logged out of your Chitter account'
  end
end