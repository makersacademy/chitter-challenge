feature 'Feature - authentication' do
  before(:each) do
    @user = User.create(first_name: 'Test',
      last_name: 'McTest',
      username: 'Testannosaurus',
      email: 'test@example.com',
      password: 'password123')
  end

  it 'a user can sign in' do
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Testannosaurus'
  end

  scenario 'a user sees an error if they get their email wrong' do
    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, Testannosaurus'
    expect(page).to have_content 'You have signed out.'
  end
end
