feature 'password recovery' do
  before do
    sign_up
    Capybara.reset!
  end
  let(:user) { User.first }

  scenario "you cannot use the token after after an hour" do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content "Your token is invalid"
    end
  end

  scenario "it asks for your new password when your token is invalid" do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content("Please enter your new password")
  end

  scenario "it lets you enter a new password with a valid token" do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: "newpassword"
    fill_in :password_confirmation, with: "newpassword"
    click_button "Submit"
    expect(page).to have_content("Please sign in")
  end

  scenario "you can sign in after resetting your password" do
    recover_password
    set_password("newpassword", "newpassword")
    log_in(email: "example@example.com", password: "newpassword")
    expect(page).to have_content "Welcome to Chitter, example@example.com"
 end

  scenario "token is immediately reset upon successful pasword update" do
    recover_password
    set_password("newpassword", "newpassword")
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content("Your token is invalid")
  end
end
