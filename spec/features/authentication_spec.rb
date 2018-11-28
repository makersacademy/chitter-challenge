feature 'authentication' do
  before :each do
    User.create(firstname: 'Test', lastname: 'McTest', username: 'mrtest', email: 'test@example.com', password: 'password123')
  end

  scenario 'a user can sign in' do
    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('log in')

    expect(page).to have_content 'Welcome, Test'
  end

  scenario 'a user sees an error if they get their email wrong' do
    visit '/sessions/new'
    fill_in('email', with: 'nottherightemail@me.com')
    fill_in('password', with: 'password123')
    click_button('log in')

    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'Email address not recognised.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('log in')

    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'Incorrect password.'
  end

  scenario 'a user can sign out' do
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('log in')
    click_button('sign out')
    
    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'You have signed out.'
  end
end
