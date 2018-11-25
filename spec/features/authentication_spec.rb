feature 'authentication' do
  before do
    visit '/sessions/new'
    User.create(name: 'Sam', email: 'sam@example.com', password: 'password123')
  end
  scenario 'a user can sign in' do
    fill_in :email, with: 'sam@example.com'
    fill_in :password, with: 'password123'
    click_button('Sign in')

    expect(page).to have_content 'Welcome, sam@example.com'
  end

  scenario 'a user sees an error if they get their email wrong' do
    fill_in(:email, with: 'nottheiremil@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content "Welcome, sam@example.com"
    expect(page).to have_content "Please check your email or password"
  end

  scenario 'a user sees an error if they get their password wrong' do
    fill_in(:email, with: 'sam@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content "Welcome, sam@example.com"
    expect(page).to have_content "Please check your email or password"
  end

  scenario 'a user can Sign out' do
    fill_in :email, with: 'sam@example.com'
    fill_in :password, with: 'password123'
    click_button('Sign in')

    expect(page).to have_content 'Welcome, sam@example.com'

    visit '/peeps'
    click_button('Sign out')
    expect(page).to have_content 'You have signed out, bye.'
  end
end
