feature 'log in' do

  scenario 'Cannot log in if there is no account to login to' do
    visit '/'
    click_button('Log In')
    fill_in('username', with: 'Noname')
    fill_in('password', with: 'Um')
    click_button('Submit')
    expect(page).to have_content('Login failed')
  end

  scenario 'Can log in if an account has been created' do
    connection = PG.connect(dbname: 'chitter_test')
    Chitter_Model.create_account(name: 'Someone',username: 'Someone',password: 'Password',email: 'myemail',time: '2021-12-11 16:48:09')
    visit '/'
    click_button('Log In')
    fill_in('username', with: 'Someone')
    fill_in('password', with: 'Password')
    click_button('Submit')
    expect(page).to have_content("You've successfully logged in as Someone!")
  end

end