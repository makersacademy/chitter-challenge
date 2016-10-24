feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, alice123")
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'with invalid email format' do
     sign_up(email: 'alice@examplecom')
     expect(page).to have_content "Email has an invalid format"
  end

  scenario 'with non-unique username and email' do
     sign_up
     sign_up
     expect(page).to have_content "Username is already taken Email is already taken"
  end
end

feature 'User log-in' do

  let!(:user) do
    User.create(name: 'User',
                username: 'user123',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'with incorrect credentials' do
    log_in(email: user.email, password: 'wrong')
    expect(page).not_to have_content "Welcome, #{user.username}"
    expect(page).to have_content "The email or password is incorrect"
  end
end

feature 'User log-out' do

  before(:each) do
    User.create(name: 'Test',
                username: 'test123',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being logged-in' do
    log_in(email: 'test@test.com', password: 'test')
    click_button 'Log-out'
    expect(page).to have_content('Thanks for visiting. Come back soon!')
    expect(page).not_to have_content("Welcome, test123")
    expect(page).to have_link "Log-in"
    expect(page).to have_link "Sign-up"
  end
end
