def fail_sign_up
  visit "/sign_up"
  fill_in("name", with: "Courtney")
  fill_in("user_name", with: "Court01")
  fill_in("email", with: "examplegmail.com")
  fill_in("password", with: "test")
  fill_in("password_confirmation", with: "test")
  click_button("Sign Up")
end

def fail_log_in
  visit('/log_in')
  fill_in("user_name", with: "Court")
  fill_in("password", with: "test")
  click_button("Log In")
end

def add_peep
  click_button("Add Peep")
  fill_in("peep", with: "Nothing that easy is rewarding")
  click_button("Post")
  click_button("Add Peep")
  fill_in("peep", with: "Be somebody and no one thought you can be")
  click_button("Post")
end
