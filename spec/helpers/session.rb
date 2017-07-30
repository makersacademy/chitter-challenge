module SessionHelpers
  def sign_up(username: "dangermouse", email: "mouse@dmhideout.com",
              password: "penfoldshush", password_confirmation: "penfoldshush")
    visit("/users/new")
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Sign up"
  end

  def sign_in(username: "dangermouse", password: "penfoldshush")
    visit("/sessions/new")
    fill_in :username, with: username
    fill_in :password, with: password
    click_button "Sign in"
  end
end
