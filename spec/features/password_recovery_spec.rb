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
    end
  end

end
