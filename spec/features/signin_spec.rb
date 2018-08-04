feature 'input username' do
  scenario 'click submit after entering username' do
    visit ('/login')
    fill_in('username', with: 'eddyt993')
    click_button 'Submit'

#    connection = PG.connect(dbname: 'chitter_test')
#    connection.exec("SELECT * FROM user_info;")

    expect(page).to have_content "Signed in as @eddyt993"
  end
end
