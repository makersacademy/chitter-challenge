feature 'authentication' do
  scenario 'a user can sign in' do
    User.create('email' 'sam@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in('name', with: 'Sam')
    fill_in(:email, with: 'sam@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, sam@example.com'
  end
end

feature 'wrong email' do

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'sam@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'nottheiremil@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content "Welcome, sam@example.com"
    expect(page).to have_content "Please check your email or password"
  end
  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'sam@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'nottheiremil@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content "Welcome, sam@example.com"
    expect(page).to have_content "Please check your email or password"
  end
end
