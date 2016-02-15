module SessionHelpers

  def sign_in(email: "bob@gmail.com", password: "password")
    visit '/sessions/new'
    fill_in "email", with: email
    fill_in "password", with: password
    click_button "Sign In"
  end

  def sign_up(email: "bob@gmail.com", password: "password",
              password_confirmation: "password", name: "Bob",
              username: "bob321")
    visit '/users/new'
    fill_in "email", with: email
    fill_in "password", with: password
    fill_in "password confirmation", with: password_confirmation
    fill_in "name", with: name
    fill_in "username", with: username
    click_button "Submit"
  end

end
