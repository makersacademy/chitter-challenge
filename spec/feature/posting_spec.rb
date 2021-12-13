feature 'posting chitt' do

  scenario 'Can post a chitt' do
    visit '/chitter/post'
    fill_in('chitt', with: "Im making a test Chitt!")
    click_button('Submit')
    click_button('View Chitts')
    expect(page).to have_content 'Someone - Im making a test Chitt!'
  end

  scenario 'Can log in and post a chitt under your username' do
    visit'/'
    connection = PG.connect(dbname: 'chitter_test')
    Chitter_Model.create_account(name: 'Someone',username: 'Someone',password: 'Password',email: 'myemail',created_on: '2021-12-11 16:48:09')
    click_button('Log In')
    fill_in('username', with: 'Someone')
    fill_in('password', with: 'Password')
    click_button('Submit')
    click_button('Back to home')
    click_button('Post Chitt')
    fill_in('chitt', with: "Im making a testing Chitt!")
    click_button('Submit')
    click_button('View Chitts')
    expect(page).to have_content 'Someone - Im making a testing Chitt!'
  end

end
