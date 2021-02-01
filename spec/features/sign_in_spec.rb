require './lib/user'

feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to  have_content 'Welcome, test@example.com'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in('email', with: "wrongemail@example.com")
    fill_in(:password, with: 'password123')
    click_button("Sign in")

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password'
  end
end
