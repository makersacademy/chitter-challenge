require 'pg'

feature 'add new user' do
  scenario 'can add new user to the user database'
    connection = PG.connect(dbname: 'users_test')

    visit('/')
    fill_in :username, with: 'RyanGrimes'
    fill_in :password, with: 'password123'
    click_button('Submit')

    expect(page).to have_content "You are signed in as RyanGrimes"
  end
end

#This test should fail but doesn't?