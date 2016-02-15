feature 'Forgot Password' do

  before do
    allow(EmailToken).to receive(:call)
  end

  scenario 'When click forgot Password, gets redirected to forgot password page' do
    visit('/users/login')
    click_link('Forgot Password?')
    expect(current_path).to eq '/users/forgot-password'
    expect(page).to have_content 'Password Reset Form'
  end

  scenario 'A user submits an email to receive a token, and a token is generated' do
    signup
    logout
    visit '/users/forgot-password'
    fill_in('email', with: 'a@a.com')
    click_button('Send Email')
    user = User.first(email: 'a@a.com')
    expect(user.password_token).not_to eq nil
  end

  scenario 'A user visits the password reset link and resets the password' do
    signup
    logout
    visit '/users/forgot-password'
    fill_in('email', with: 'a@a.com')
    click_button('Send Email')
    user = User.first(email: 'a@a.com')
    visit("/token/#{user.password_token}")
    expect(current_path).to eq '/users/reset-password'
    fill_in('password', with: "asd")
    fill_in('password_confirmation', with: "asd")
    click_button('Reset')
    expect(current_path).to eq '/users/login'
    login(password: 'asd')
    expect(page).to have_content('Welcome Alex')
  end
end
