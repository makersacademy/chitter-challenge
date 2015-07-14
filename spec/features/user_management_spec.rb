feature 'User sign up' do

  scenario 'can sign up as new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, examplealice')
    expect(User.first.email).to eq('alice@example.com')
  end

  def sign_up(username: 'examplealice', email: 'alice@example.com', password: 'oranges!', password_confirmation: 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up_p(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up_p(email: 'alice@example.com', password: '123', password_confirmation: '123')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'password doesnt match' do
    expect { sign_up_p(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Your passwords do not match')
  end

  scenario 'cannot sign up with an existing email' do
    user = build :user
    sign_up_as(user)
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email already registered')
  end

  def sign_up_as(user)
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password
    click_button 'Sign up'
  end
end

feature 'User sign in' do
  scenario 'with correct info' do
    user = create :user
    sign_in_as(user)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  def sign_in_as(user)
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Login'
  end
end

feature 'User logout' do

  scenario 'logging out while signed in' do
    user = create :user
    sign_in_as(user)
    click_button 'Logout'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content("Welcome, #{user.username}")
  end

  def sign_in_as(user)
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Login'
  end
end