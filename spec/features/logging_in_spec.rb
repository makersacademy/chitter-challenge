feature 'User login' do

  let!(:user) do
    User.create(name: 'Jennifer Bacon',
                username: 'jennyb',
                email: 'user@example.com',
                password: 'secret1234')
  end

  before do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end

  # def sign_in(email:, password:)
  #   visit '/sessions/new'
  #   fill_in :email, with: email
  #   fill_in :password, with: password
  #   click_button 'Log in'
  # end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: 'secret1234')
    expect(page).to have_content "Welcome to Chitter, #{user.username}"
    expect(page).to have_button "Go to peeps page"
  end

  scenario 'with incorrect credentials' do
    sign_in(email: user.email,   password: 'secret1235')
    expect(page).to have_content "The email or password is incorrect"
  end

end
