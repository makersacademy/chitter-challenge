feature "Registers the user /" do
  subject(:test_user){User.first(username: 'Mad Hare')}

  scenario " name field is filled in" do
    log_details()
    expect(test_user.name).to have_content("Nicholas Alberto Leacock")
  end

  scenario " username field is filled in" do
    log_details()
    expect(test_user.username).to have_content("Mad Hare")
  end

  scenario " password field is filled in" do
    log_details()
    expect(test_user.password_digest).not_to have_content("abc")
  end

  scenario " e-mail field is filled in" do
    log_details()
    expect(test_user.email).to have_content("nicholas@swissmail.com")
  end

  scenario " Submit button is pressed" do
    log_details()
    expect(page).to have_content("Welcome Mad Hare!")
  end

end
