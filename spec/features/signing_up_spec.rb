feature "signing up" do
  scenario "returns you to the sign up page if email is not unique" do
    sign_up_user
    sign_up_same_email
    expect(page).to have_content('Email in use')
  end

  scenario "returns you to the sign up page if username is not unique" do
    sign_up_user
    sign_up_same_username
    expect(page).to have_content('Username in use')
  end

  scenario "takes you to the homepage with your username present" do
    sign_up_user
    expect(page).to have_content('Welcome, test user')
  end
end
