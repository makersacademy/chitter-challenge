feature 'viewing messages' do
  scenario 'a user views the messages and sees them in reverse order' do
    visit '/'
    click_button('View Peeps')
    connection = PG.connect :dbname => 'chitter_manager_test', :user => 'arav'
    result = connection.exec "INSERT INTO peeps (user_name, user_handle, message) VALUES('latest', '@latest', 'first')"


    expect(page).to have_content("1. first by @latest, latest")
  end
end