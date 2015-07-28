feature 'User sign in' do
  let(:user) do
    User.create(email: 'user@example.com',
               name: 'Jack',
               username: 'therealjht',
               password: 'secret1234',
               password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end

feature 'User signs out' do
  before(:each) do
    User.create(email: 'user@example.com',
               name: 'Jack',
               username: 'therealjht',
               password: 'secret1234',
               password_confirmation: 'secret1234')
  end

  scenario 'while being signed in' do

    def sign_in(email:, password:)
      visit '/sessions/new'
      fill_in :email,    with: email
      fill_in :password, with: password
      click_button 'Sign in'
    end

    sign_in(email: 'user@example.com', password: 'secret1234')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!') # where does this message go?
    expect(page).not_to have_content('Welcome, user@example.com')
  end
end
