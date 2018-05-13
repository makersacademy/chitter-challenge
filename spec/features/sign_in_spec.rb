feature 'signing in' do
  scenario 'correct inputs' do
    password = 'verysecret123'
    name = 'Shrimply Pibbles'
    username = 'shrimplyp'
    visit('/')
    new_user('peep.loverl337@booglemail.com',
             password,
             name,
             username)
    fill_in('username', with: username)
    fill_in('password', with: password)
    click_button('Log in')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content(name)
  end
end
