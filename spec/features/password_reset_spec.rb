feature "password reset" do

  before do
    user_sign_up
    Capybara.reset!
  end

  let(:user) { User.first }

  scenario "user can reset their password via a link" do
    visit '/sessions/new'
    click_link "I forgot my password"
    expect(page).to have_content "Please enter your email"
  end

  scenario "user is told to check inbox when email is entered" do
    recover_password
    expect(page).to have_content "Please check your inbox for the reset link."
  end

  scenario "user is sent a reset token for password recovery" do
    expect { recover_password }.to change{ User.first.password_token }
  end

  scenario "the token expires after an hour" do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit "/user/reset_password?token=#{user.password_token}"
      expect(page).to have_content "Your token has expired"
    end
  end

  scenario "it lets you enter a new password with a valid token" do
    recover_password
    user_reset_password
    expect(page).to have_content("Enter email")
  end

  scenario "it lets you sign in after password reset" do
     recover_password
     user_reset_password
     user_sign_in_new_password
     expect(page).to have_content "Welcome Ellie"
   end

   scenario "error message is thrown if passwords do not match" do
     recover_password
     visit("/user/reset_password?token=#{user.password_token}")
     fill_in :password, with: "newpassword"
     fill_in :password_confirmation, with: "wrongpassword"
     click_button "Submit"
     expect(page).to have_content("Your passwords do not match!")
  end

  scenario "token is reset upon password update" do
    recover_password
    user_reset_password
    visit "/user/reset_password?token=#{user.password_token}"
    expect(page).to have_content "Your token has expired"
  end
end
