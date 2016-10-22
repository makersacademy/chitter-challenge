feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, alice123")
    expect(User.first.email).to eq('alice@example.com')
  end
end

feature 'User log-in' do
  let!(:user) do
    User.create(email: 'user@example.com',
                username: 'user123',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end
  scenario 'with correct credentials' do
    log_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end
end

feature 'User log-out' do
  before(:each) do
    User.create(email: 'test@test.com',
                username: 'test123',
                password: 'test',
                password_confirmation: 'test')
  end
  scenario 'while being logged-in' do
    log_in(email: 'test@test.com', password: 'test')
    click_button 'Log-out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content("Welcome, test123")
  end
end
