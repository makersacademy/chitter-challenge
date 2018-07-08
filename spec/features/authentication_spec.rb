feature 'authentication' do

  before(:each) do
    User.create(name: 'Test', username: 'test123', email: 'test@example.com', password: '123')
  end

  it 'a user can sign in' do
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: '123')
    click_button('Log in')

    expect(page).to have_content 'Welcome Test'
  end

  it 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: '123')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: '123')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome Test'
    expect(page).to have_content 'Please check your log in details and try again'
  end

  it 'a user sees an error if they get their password wrong' do

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome Test'
    expect(page).to have_content 'Please check your log in details and try again'
  end

  it 'a user can sign out' do

    # Sign in as that user
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: '123')
    click_button('Log in')

    # Sign out
    click_button('Log out')

    expect(page).not_to have_content 'Welcome Test'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
