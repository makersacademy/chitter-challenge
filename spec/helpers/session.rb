module SessionHelpers
  def user_signup(full_name: 'John Doe',
                  username: 'JohnnyD',
                  email: 'johndoe@email.com',
                  password: 'pass123',
                  password_confirmation: 'pass123')
    visit 'users/new'
    expect(page.status_code).to eq 200
    fill_in 'full_name', with: full_name
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button 'Sign up'
  end

  def user_login(email:, password:)
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Log in'
  end
end
