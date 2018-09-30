
feature 'authenticate' do
  scenario 'user can enter her username and password to sign in' do
    User.create(name: 'freya', username: 'frez' ,email: 'test456@example.com', password: 'password123456')
    # Then sign in as them
    visit '/sessions/new'
    fill_in(:email, with: 'test456@example.com')
    fill_in(:password, with: 'password123456')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, frez'

  end
end

feature 'authentication' do
  scenario 'a user sees an error if they get their email wrong' do
    User.create(name: 'freya', username: 'frez' ,email: 'test@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, frez'
    expect(page).to have_content 'Please check your email or password.'
  end
end
