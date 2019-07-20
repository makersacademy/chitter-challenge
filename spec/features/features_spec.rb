feature 'allows a user to post a peep' do
  scenario 'post a peep' do
    visit('/')
    fill_in 'Whats on your mind?', with: 'first peep!'
    click_button("Post")
    expect(page).to have_content 'first peep!'
  end

  # scenario 'seeing the time a next to a peep' do
  #   visit('/')
  #   fill_in 'Whats on your mind?', with: 'first peep!'
  #   click_button("Post")
  #   expect(page).to have_content Time.now
  # end
end

feature 'allows a user to sign up for chitter' do

  scenario 'homepage has link to sign-up page' do
    visit('/')
    expect(page).to have_selector(:css, 'a[href="/users"]')
  end

  scenario 'sign up to chitter' do
    visit('/users')
    fill_in 'username', with: 'richieganney'
    fill_in 'email', with: 'richieganney@icloud.com'
    fill_in 'password', with: 'Password123'
    click_button("Sign up!")
    expect(page).to have_content "Welcome, richieganney"
  end

  scenario 'authenticated a user and allows them to sign in' do
    User.add('richieganney', 'richieganney@icloud.com', 'Password123')
    visit('/sessions/new')
    fill_in 'email', with: 'richieganney@icloud.com'
    fill_in 'password', with: 'Password123'
    click_button("Sign in")

    expect(page).to have_content "Welcome, richieganney"
  end

  scenario 'a user sees an error if they get their details wrong' do
    User.add('testy_boi', 'test@example.com', 'password123')

    visit('/sessions/new')
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password'
  end
end
