feature 'authentication' do
  scenario 'a user can sign in' do
    # creat a test user
    User.create(fullname: 'John Jones', username: 'JJones', email: 'test@example.com', password: 'password123')

    # Sign in
    visit('/peeps')
    click_button('Sign in')
    expect(current_path).to eq '/sessions/new'

    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content('Welcome, JJones')
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(fullname: 'John Jones', username: 'JJones', email: 'test@example.com', password: 'password123')

    visit('/peeps')
    click_button('Sign in')
    visit('/sessions/new')
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content('Welcome, JJones')
    expect(page).to have_content('Please check your email or password')
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(fullname: 'John Jones', username: 'JJones', email: 'test@example.com', password: 'password123')

    visit('/peeps')
    click_button('Sign in')
    visit('/sessions/new')
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'notthecorrectpassword123')
    click_button('Sign in')

    expect(page).not_to have_content('Welcome, JJones')
    expect(page).to have_content('Please check your email or password')
  end

  scenario 'a user can sign out' do
    User.create(fullname: 'John Jones', username: 'JJones', email: 'test@example.com', password: 'password123')

    visit('/peeps')
    click_button('Sign in')
    expect(current_path).to eq '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content('Welcome, JJones')
    expect(page).to have_selector("input", :class => 'sign_in')
  end

end
