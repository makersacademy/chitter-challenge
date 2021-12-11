require 'pg'

feature 'sign up page' do
  scenario 'user can sign up for Chitter' do
    visit('/sign-up')

    fill_in('name', :with => 'Birdy')
    fill_in('username', :with => 'fly_away')
    fill_in('email', :with => 'example@gmail.com')
    fill_in('password', :with => '*****')
    click_on('Submit')

    users = DatabaseConnection.query("SELECT * FROM Users")

    expect(users[0]['name']).to eq 'Birdy'
    expect(users[0]['username']).to eq 'fly_away'
    expect(users[0]['email']).to eq 'example@gmail.com'
    expect(users[0]['password']).to eq '*****'

    expect(page).to have_content 'Welcome Birdy!'
  end
end
