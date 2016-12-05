module SessionHelpers
  def login(email:, password:)
    visit "/sessions/new"
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Login"
  end

  def logout(email: "alic@g.com", password: "1234", password_confirmation: "1234")
    visit "users/new"
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Log out"
  end
end
