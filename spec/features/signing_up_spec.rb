feature "Signing Up" do
  scenario "a visitor can sign up" do
    sign_up
    expect(page).to have_content "Welcome, @joedoe"
  end

  scenario "passwords must match" do
    sign_up(password_confirmation: "wrong")
    expect(page).to have_content "Password does not match"
  end

  scenario "username is unique" do
    sign_up
    expect{sign_up(email: 'different@gmail.com')}.not_to change(User, :count)
  end

  scenario "email is unique" do
    sign_up
    expect{ sign_up(username: 'different') }.not_to change(User, :count)
  end

  scenario "all fields are required" do
    sign_up(username: nil, name: nil, email: nil, password: nil, 
            password_confirmation: nil)
    expect(page).to have_content("Username must not be blank")
    expect(page).to have_content("Name must not be blank")
    expect(page).to have_content("Email must not be blank")
    expect(page).to have_content("Password must not be blank")
  end
end
