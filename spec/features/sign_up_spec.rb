
feature "Sign-Up" do

  scenario "User goes to sign up page and signs in" do

    user_count = User.count
    expect { sign_up }.to change(User, :count).by(1)

  end

  scenario "User doesn't add name" do
    expect { sign_up(name: nil) }.not_to change(User,:count)
  end

  scenario "Passwords don't match" do

    expect { sign_up(password_confirmation: "Wrong") }.not_to change(User,:count)

  end

  scenario "User tries to input non-unique email" do
    email = "rick@astley.com"
    create_user(email: email )
    expect {sign_up(email: email) }.not_to change(User,:count)
  end

  scenario "User tries to input and invalid email" do
    expect {sign_up(email: "NOT AN EMAIL") }.not_to change(User,:count)


  end

  scenario "User tries to input non-unique username" do
    username = "rickroll"
    create_user(username: username)
    expect {sign_up(username: username) }.not_to change(User,:count)

  end
end
