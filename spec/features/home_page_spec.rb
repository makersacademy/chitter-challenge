feature 'view a welcome page' do
  scenario 'Basic greeting on home page' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
  scenario 'Known user CAN log in with correct password' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO users (user_name, password) VALUES('Testname', '123')")
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
    fill_in :user_name, with: "Testname"
    fill_in :password, with: "123"
    click_button('Log in')
    expect(page).to have_content('Password correct')
  end
  scenario "Known user CAN'T log in with incorrect password" do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO users (user_name, password) VALUES('Testname', '123')")
    visit('/')
    #expect(page).to have_content('Welcome to Chitter')
    fill_in :user_name, with: "Testname"
    fill_in :password, with: "bob"
    click_button('Log in')
    expect(page).to have_content('Password incorrect')
  end
end
