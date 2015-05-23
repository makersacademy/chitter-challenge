feature 'User logs in' do
  before (:each) do
    User.create(username: 'rodcul',
                email: 'rodcul@gmail.com',
                password: 'test1234')
  end

  scenario 'successfully' do
    visit '/'
    expect(page).not_to have_content('Welcome, rodcul')
    click_link('Log in')
    fill_in('username', with: 'rodcul')
    fill_in('password', with: 'test1234')
    click_button('Log in')
    expect(page).to have_content('Welcome, rodcul')
  end
end
