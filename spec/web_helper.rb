def visit_page
  visit '/users/new'
  expect(page.status_code).to eq 200
end


def form_filled_wrong
  visit_page
  fill_in :email, with: "example@ymail.com"
  fill_in :password, with: "sup£rs3cret"
  fill_in :password_confirmation, with: "sup£cret"
  fill_in :name, with: "Marco Bagnasco"
  fill_in :username, with: "Smoodge"
  click_button "Sign Up"
end

def form_email_wrong
  visit_page
  fill_in :email, with: "exampleymail.com"
  fill_in :password, with: "sup£rs3cret"
  fill_in :password_confirmation, with: "sup£rs3cret"
  fill_in :name, with: "Marco Bagnasco"
  fill_in :username, with: "Smoodge"
  click_button "Sign Up"
end

def form_filled
  visit_page
  fill_in :email, with: "example@ymail.com"
  fill_in :password, with: "sup£rs3cret"
  fill_in :password_confirmation, with: "sup£rs3cret"
  fill_in :name, with: "Marco Bagnasco"
  fill_in :username, with: "Smoodge"
  click_button "Sign Up"
end
 
 def sign_up_wrong_email(email: "example@ymail.com",
             password: "sup£rs3cret",
             password_confirmation: "sup£rs3cret",
             name: "Marco Bagnasco",
             username: "Smoodge")
             form_email_wrong
 end
 
 def sign_up_wrong(email: "example@ymail.com",
             password: "sup£rs3cret",
             password_confirmation: "sup£rs3cret",
             name: "Marco Bagnasco",
             username: "Smoodge")
             form_filled_wrong
 end
 
 def sign_up(email: "example@ymail.com",
             password: "sup£rs3cret",
             password_confirmation: "sup£rs3cret",
             name: "Marco Bagnasco",
             username: "Smoodge")
             form_filled
 end