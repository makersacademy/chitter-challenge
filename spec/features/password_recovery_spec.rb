feature "password recovery" do
  before do
    sign_up
  end

  let(:user) { User.first }

  scenario "user can choose to reset password when trying to login" do
    logout
    visit "/peeps"
    click_link "Login"
    expect(page).to have_content "I've forgotten my password"
  end

  scenario "user has option to reset their password" do
    logout
    visit "/sessions/new"
    click_link "I've forgotten my password"
    expect(page).to have_content "Please enter your email to reset password"
  end

  scenario "user enters email address to get a reset token" do
    request_reset_password
    expect(page).to have_content "Please check your emails"
  end

  scenario "user enters invalid email address to get a reset token" do
    request_reset_password("unregistered_user@gmail.com")
    expect(page).to have_content "Please check your emails"
  end

  scenario "a reset token is stored in database for the user" do
    expect{request_reset_password}.to change{User.first.password_token}
  end

  scenario "try to reset password after 1 hour since token was saved" do
    request_reset_password
    logout
    Timecop.travel(60 * 60 * 60) do
      visit ("/users/password_reset?token=#{user.password_token}")
      expect(page).to have_content "Invalid password token"
    end
  end

  scenario "a time is saved in the database when token saved" do
    expect{request_reset_password}.to change{User.first.password_token_time}
  end

  scenario "the current time is saved in the database when token saved" do
    Timecop.freeze do
      user.store_token
      expect(user.password_token_time).to be < Time.now + 1
    end
  end

  scenario "try to reset password less 1 hour since token was saved" do
    request_reset_password
    visit ("/users/password_reset?token=#{user.password_token}")
    expect(page).to have_content "Please enter your new password"
  end

  scenario "reset password when new passwords match" do
    request_reset_password
    update_password
    expect(current_path).to eq '/sessions/new'
  end

  scenario "reset password fails when new passwords don't match" do
    request_reset_password
    params={password: "my_new_password",
            password_confirmation: "not_my_new_password"}
    update_password(params)
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "login with new password after reset" do
    logout
    request_reset_password
    update_password
    params={email: "amy@gmail.com",
            password: "my_new_password"}
    login(params)
    expect(page).to have_content "Hello Amy!"
  end
end
