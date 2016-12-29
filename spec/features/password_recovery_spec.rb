require 'timecop'

feature "Password Recovery" do

  before do
    sign_up
  end

  let(:user) {User.first}

  scenario "log in page has 'forgotten password link'" do
    visit "/sessions/new"
    click_link "forgotten password?"
    expect(page).to have_content 'Please enter your email'
  end

  scenario "filling in email provides you with a confirmation message" do
    recover_password
    expect(page).to have_content 'a token has been emailed to you!'
  end

  scenario "recovering password releases a token to the user" do
    expect{recover_password}.to change{User.first.password_token}
  end

  scenario "the token is only vaid for one hour" do
    recover_password
    Timecop.travel(3600) do
      visit("/users/enter_token/#{user.password_token}")
      expect(page).to have_content("sorry your token is invalid")
      expect(page).not_to have_content("please enter your new password")
    end
  end

  scenario "asks for a new password if the token is valid" do
    recover_password
    visit("/users/enter_token/#{user.password_token}")
    expect(page).to have_content("please enter your new password")
    expect(page).not_to have_content("sorry your token is invalid")
  end

  scenario "if the token is valid user can enter a new password" do
    recover_password
    reset_password
    expect(current_path).to eq "/sessions/new"
  end

  scenario "can sign in with the new password" do
    recover_password
    reset_password
    fill_in 'email', :with => 'samuel@gmail.com'
    fill_in 'password', :with => 'newpassword'
    click_button 'log-in'
    expect(page).to have_content "Welcome samuel@gmail.com"

  end

end
