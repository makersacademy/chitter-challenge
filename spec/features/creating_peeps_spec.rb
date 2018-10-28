feature 'Feature - Posting a Peep' do
  scenario 'A non-logged in user cannot post a Peep' do
    visit('/')
    expect(page).not_to have_selector("#peep-form")
  end

  scenario 'A logged in user can post a Peeprspec' do
    User.create(first_name: 'Test',
      last_name: 'McTest',
      username: 'Testannosaurus',
      email: 'test@example.com',
      password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    fill_in('message', with: 'A Peep posted by a user')
    click_button('Peep')

    expect(page).torpe have_content 'A Peep posted by a user'
  end
end
