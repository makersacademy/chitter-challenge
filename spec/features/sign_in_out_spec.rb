feature 'signing in to Chitter' do
  let!(:user) do
    User.create(username: 'DizzyUnicorn', email: 'dizzy@unicorn.com', password: 'rainbow123', password_confirmation: 'rainbow123')
  end

  scenario 'sign in with the correct info' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Hello, #{user.username}"
  end

  def sign_in(email:, password:)
    visit('/sessions/new')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Sign in')
  end
end

feature 'signing out of Chitter' do
  before(:each) do
    User.create(username: 'DizzyUnicorn', email: 'dizzy@unicorn.com', password: 'rainbow123', password_confirmation: 'rainbow123')
  end

  scenario 'while signed in' do
    sign_in(email: 'dizzy@unicorn.com', password: 'rainbow123')
    click_button('Sign out')
    expect(page).to have_content('See you again!')
    expect(page).not_to have_content('Welcome, DizzyUnicorn')
  end
end
