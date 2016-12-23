feature "Password Recovery" do
  scenario "log in page has 'forgotten password link'" do
    visit "/sessions/new"
    click_link "forgotten password?"
    expect(page).to have_content 'Please enter your email'
  end

  scenario "filling in email provides you with a confirmation message" do
    recover_password
    expect(page).to have_content 'a token has been emailed to you!'
  end
end
