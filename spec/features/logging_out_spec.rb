feature 'User logout' do

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

  scenario 'User logs out and sees goodbye message' do
    sign_in(email: user.email, password: 'secret1234')
    click_button 'Go to peeps page'
    click_button 'Log out'
    click_button 'Go to peeps page'
    expect(page).to have_no_button "Add peep"
    expect(page).to have_no_button "Log out"
  end

end
