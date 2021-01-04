require 'pg'

feature ChitterApp do
  scenario "see homepage content" do
    visit '/'
    expect(page).to have_content("Register or sign in to Chitter!")
  end

  scenario "having a registration box" do
    visit("/")
    expect(page).to have_content('Chitter')

    fill_in(:r_username, with: "Test_user")
    fill_in("email", with: "test_user@example.com")
    fill_in("fname", with: "Lorem")
    fill_in("lname", with: "Ipsum")
    fill_in("r_pwd", with: "password")
    expect(page).to have_selector("input[type=submit][value='Register']")
    expect(page).to have_current_path "/"
    click_button 'Register'

    expect(page).to have_current_path "/register"
    expect(page).to have_content('Welcome, Test_user')
  end

  scenario "having a log in box" do
    username = 'test_user'
    password = 'loremipsum'
    connection = PG.connect(dbname: 'chitter_test')
    connection.prepare("insert_new_user", "INSERT INTO users (username, email, first_name, last_name, password) VALUES ($1, $2, $3, $4, $5);")
    connection.exec_prepared("insert_new_user", ['test_user', 'testuser@acme.inc', 'Joe', 'Doe', 'loremipsum'])
    visit("/")
    expect(page).to have_content('Chitter')
    fill_in(:l_username, with: 'test_user')
    fill_in(:l_pwd, with: 'loremipsum')
    expect(page).to have_selector("input[type=submit][value='Login']")
    expect(page).to have_current_path "/"
    click_button 'Login'
    expect(page).to have_current_path "/login"
    expect(page).to have_content('Welcome,')
  end
  scenario "giving an error " do
    username = 'test_user'
    password = 'loremipsum'
    connection = PG.connect(dbname: 'chitter_test')
    connection.prepare("insert_new_user", "INSERT INTO users (username, email, first_name, last_name, password) VALUES ($1, $2, $3, $4, $5);")
    connection.exec_prepared("insert_new_user", ['test', 'testuser@acme.inc', 'Joe', 'Doe', 'loremipsum'])
    visit("/")
    expect(page).to have_content('Chitter')
    fill_in(:l_username, with: 'test_user')
    fill_in(:l_pwd, with: 'loremipsum')
    expect(page).to have_selector("input[type=submit][value='Login']")
    expect(page).to have_current_path "/"
    click_button 'Login'
    expect(page).to have_current_path "/"
  end
  scenario "adding a new tweet" do
    visit("/")
    expect(page).to have_content('Chitter')
    fill_in(:r_username, with: "Test_user")
    fill_in("email", with: "test_user@example.com")
    fill_in("fname", with: "Lorem")
    fill_in("lname", with: "Ipsum")
    fill_in("r_pwd", with: "password")
    expect(page).to have_selector("input[type=submit][value='Register']")
    expect(page).to have_current_path "/"
    click_button 'Register'
    expect(page).to have_current_path "/register"
    expect(page).to have_content('Welcome, Test_user')
    click_button 'Add!'
    expect(page).to have_current_path "/new"
  end

  scenario "allows user to log out" do
    visit("/")
    expect(page).to have_content('Chitter')
    fill_in(:r_username, with: "Test_user")
    fill_in("email", with: "test_user@example.com")
    fill_in("fname", with: "Lorem")
    fill_in("lname", with: "Ipsum")
    fill_in("r_pwd", with: "password")
    expect(page).to have_selector("input[type=submit][value='Register']")
    expect(page).to have_current_path "/"
    click_button 'Register'
    expect(page).to have_current_path "/register"
    click_button "Logout"
    expect(page).to have_current_path "/"
  end
end
