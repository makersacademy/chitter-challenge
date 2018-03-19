feature "Authentication" do

  scenario "You can sign in" do
    User.create('George', 'test@example.com', 'password123')

    visit('/')
    click_button('Sign in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(page).to have_content("Welcome George")
  end

  scenario "User sees an error if they get their email wrong" do
    User.create('George', 'test@example.com', 'password123')

    visit('/')
    click_button('Sign in')
    fill_in('email', with: 'incorrect@incorrect.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content("Welcome George")
    expect(page).to have_content('Please check your email or password')
  end

  scenario "User sees an error if they get their password wrong" do
    User.create('George', 'test@example.com', 'password123')

        visit '/'
        click_button('Sign in')
        fill_in(:email, with: 'test@example.com')
        fill_in(:password, with: 'wrongpassword')
        click_button('Sign in')

        expect(page).not_to have_content 'Welcome, George'
        expect(page).to have_content 'Please check your email or password'
  end

end
