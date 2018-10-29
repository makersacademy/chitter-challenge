require_relative './web_helpers.rb'

feature 'index page' do

  scenario 'user can sign up to Chitter' do
    sign_in
    expect(page).to have_content 'Hello Gordon'
  end

  scenario 'user can not signup if their email and password are not unique' do
    sign_in
    sign_in
    expect(page).to have_content 'Both username and email must be unique.'
  end

  scenario 'user sees peeps on first homepage' do
    con = PG.connect(dbname: 'chitter_test')
    con.exec("INSERT INTO peeps (username, peep, time)VALUES('FayJ', 'Hello', '#{Time.now}')")
    visit('/')
    expect(page).to have_content 'Hello'
  end
end

feature 'signed_in page' do
  scenario 'user posts to Chitter and then sees it' do
    sign_in
    fill_in('peep', with: 'This is my first ever peep!')
    click_button 'Peep'
    expect(page).to have_content 'This is my first ever peep!'
  end
end
