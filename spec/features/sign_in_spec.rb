feature "sign-in" do
  scenario 'welcome message when signing-up correctly' do
    User.create(name: "name", username: "username", email: "email", password: "password", password_confirmation: "password")
    sign_in("email", "password")
    expect(page).to have_content ("Welcome username!")
  end
  scenario 'no message when signing-up incorrectly' do
    sign_in("no_email", "no_password")
    expect(page).not_to have_content ("Welcome!")
  end
end
