
feature 'allows a user to post a peep' do
  scenario 'post a peep' do
    sign_up_and_sign_in_as_richie
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
    sign_up_as_test
    expect(page).to have_content "Welcome, test"
  end

  scenario 'authenticated a user and allows them to sign in' do
    sign_up_and_sign_in_as_richie
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

feature 'authenticate' do
  scenario 'a user can sign out' do
    sign_up_and_sign_in_as_test
    # Sign out
    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end

feature 'check' do
  scenario 'does not allow a user to create a create a profile with a username that is already taken' do
    User.add('testy_boi', 'test@example.com', 'password123')
    visit('/users')
    fill_in 'username', with: 'testy_boi'
    fill_in 'email', with: 'another@email.com'
    fill_in 'password', with: 'Password123'
    click_button("Sign up!")
  
    expect(page).to have_content 'username already taken'
  end

  scenario 'does not allow a user to create a create a profile with an email that is already taken' do
    User.add('testy_boi', 'test@example.com', 'password123')
    visit('/users')
    fill_in 'username', with: 'another_username'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'Password123'
    click_button("Sign up!")
  
    expect(page).to have_content 'email already taken'
  end
end
