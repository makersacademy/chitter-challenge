feature 'Signing in' do
  let!(:user) do
    User.create(name: 'George', email: 'george@curious.com', username: 'george',
                password: 'yellow_hat', password_confirmation: 'yellow_hat')
  end

  scenario 'A user can sign in to Chitter with email and password' do
    sign_in
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome to Chitter, George'
  end

  scenario 'A user can sign in to Chitter with username and password' do
    sign_in(email_or_username: 'george')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome to Chitter, George'
  end

  scenario 'A user cannot sign in to Chitter with incorrect password' do
    sign_in(password: 'yellowhat')
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email/username or password is incorrect'
  end
end
