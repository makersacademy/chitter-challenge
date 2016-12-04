module Helpers

  def sign_up
    visit "/sign_up"
    fill_in("name", with: "Courtney")
    fill_in("user_name", with: "Court01")
    fill_in("email", with: "example@gmail.com")
    fill_in("password", with: "test")
    fill_in("password_confirmation", with: "test")
    click_button("Sign Up")
  end

  def log_in
    visit('/log_in')
    fill_in("user_name", with: "Court01")
    fill_in("password", with: "test")
    click_button("Log In")
  end

end
