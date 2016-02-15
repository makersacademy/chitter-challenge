def sign_up(name: "Bob", username:"bigbob",
            email: "bob@email.com",
            password: "123abc",
            password_confirmation: "123abc"
           )
  visit('/')
  click_link 'Sign-up'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign-up'
end

def log_in(email:, password:)
  visit('/')
  click_link "Log in"
  fill_in :email, with: email
  fill_in :password, with: password
  click_button "Log in"
end
 
def create_peep
  sign_up
  fill_in :peep, with: "Hello, world!"
  click_button 'Post'
  click_button 'Log out'
end
