
feature 'authentication' do
	scenario 'makes sure that a user can sign in' do
		# Creating a test user here
		User.create(email: 'aragorn@gondor.com', password: 'qwerty')

		# Then we sign in as aragorn
		visit '/sessions/new'
		fill_in('email', with: 'aragorn@gondor.com')
		# find_field("email").set("aragorn@gondor.com")
    fill_in('password', with: 'qwerty')
		# find_field("password").set("password123")
    click_button('Sign in')

		expect(page).to have_content 'Welcome, aragorn@gondor.com'
	end

	scenario 'a user sees an error if they type a wrong email' do
    User.create(email: 'batman@gotham.com', password: 'password123')

    visit '/sessions/new'
    fill_in('email', with: 'joker@gotham.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, batman@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

	scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

	scenario 'a user can sign out' do
    # Create the user
    User.create(email: 'test@example.com', password: 'password123')

    # Sign in as that user
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    # Sign out
    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Welcome to Chitter App'
  end
end