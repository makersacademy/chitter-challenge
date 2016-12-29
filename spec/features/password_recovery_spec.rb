feature "Password Recovery" do
  scenario "log in page has 'forgotten password link'" do
    visit "/sessions/new"
    click_link "forgotten password?"
    expect(page).to have_content 'Please enter your email'
  end

  scenario "filling in email provides you with a confirmation message" do
    sign_up
    recover_password
    expect(page).to have_content 'a token has been emailed to you!'
  end

  scenario "recovering password releases a token to the user" do
    sign_up
    expect{recover_password}.to change{User.first.password_token}
  end

end
