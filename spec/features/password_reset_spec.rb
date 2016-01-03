feature 'resetting password' do
  before do
    sign_up
    Capybara.reset!
  end

  before(:each) do
    recover_password
  end

  let(:user) { User.first }

  scenario 'when user enters email address, they are told to check inbox' do
    expect(page).to have_content "Please check your inbox to set a new password."
  end

  scenario 'assigns a reset token to the user when they recover' do
    expect(user.password_token).not_to eq nil
  end

  scenario 'it doesn\'t allow you to use the token after an hour' do
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content "Your token is invalid"
    end
  end

  scenario 'it lets you reset password when your token is valid' do
     visit("/users/reset_password?token=#{user.password_token}")
     expect(page).to have_content("Please enter your new password")
     set_new_password
     expect(page).to have_content("Please sign in")
  end

  scenario 'it lets you log in with the new password' do
    set_new_password
    sign_in(email: "user@email.com", password: "newpassword")
    expect(page).to have_content "Welcome New User. You are now logged in"
  end

  scenario 'it lets you know if your passwords don\'t match' do
    recover_password
    set_new_password(password_confirmation: "wrongpassword")
    expect(page).to have_content("Passwords did not match")
  end
end
