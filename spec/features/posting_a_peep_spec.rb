feature 'Posting a Peep' do
  scenario 'users should be able to post a peep' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO users (username, name, email, password) VALUES('@a','B','c@d.com','1234');")
    User.sign_in('c@d.com','1234')
    visit('/signed_in')
    fill_in('content', with: 'A!')
    click_button('submit')
    expect(page).to have_content('A!')
  end
end