require 'pg'

feature 'login page' do
  scenario 'user can log into Chitter' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])

    visit('/')

    expect(page).not_to have_content 'Welcome Birdy!'

    visit('/log-in')
    fill_in('email', :with => 'example@gmail.com')
    fill_in('password', :with => '*****')
    click_on('Submit')

    expect(page).to have_content 'Welcome Birdy!'
  end

  scenario 'user is presented with an error message if log in details are invalid' do
    DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])

    visit('/log-in')
    fill_in('email', :with => 'i forgot')
    fill_in('password', :with => 'its a secret')
    click_on('Submit')

    expect(page).to have_content 'Invalid login, please check email and password are correct'    
  end
end
