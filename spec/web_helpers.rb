def sign_in(username = "taran314", password = "taranisthebest")
    visit('/')
    fill_in "username", with: username
    fill_in "password", with: password
    click_button "Sign in"
  end
 
  def register_user
    visit('/')
    click_button("Register")
    fill_in "name", with: "Test"
    fill_in "username", with: "test"
    fill_in "email", with: "test@hotmail.co.uk"
    fill_in "password", with: "test123"
    click_button("Submit")
  end