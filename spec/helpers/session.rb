module SessionHelpers
  def sign_up(username: "DangerMouse", email: "mouse@dmhideout.com",
              password: "penfoldshush", password_confirmation: "penfoldshush")
    visit("/users/new")
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password
    click_button "Sign up"
  end
end
