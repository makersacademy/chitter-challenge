feature 'sign in' do 
  scenario 'user can sign in' do
    User.create(email: 'test@example.com', password: 'password123', username: 'test') 
    visit '/sessions'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Hello, test'
  end 

  scenario 'sign-in fails if email is incorrect' do
    User.create(email: 'test@example.com', password: 'password123', username: 'test')
    visit '/sessions'
    fill_in(:email, with: 'test.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Invalid email/password. Please try again.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123', username: 'test')
    visit '/sessions'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')
    expect(page).to have_content 'Invalid email/password. Please try again.'
  end

  scenario 'a user can sign out' do
    User.create(email: 'test@example.com', password: 'password123', username: 'test')
    visit '/sessions'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    click_button('Sign out')
    expect(page).to have_content 'Signed out'
  end

end
