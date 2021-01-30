def log_in

  visit('/')
  fill_in("username", :with => "claude")
  fill_in("password", :with => "meow")
  click_on("submit_1")

end

def sign_up

  visit('/')
  fill_in("new_username", :with => "claude")
  fill_in("new_password", :with => "meow")
  fill_in("email", :with => "petar@simonovic.com")
  click_on("submit_2")

end
