def sign_up(params = {name: "Amy",
                      username: "amynic",
                      email: "amy@gmail.com",
                      password: "my_password"})

  visit("/users/new")
  fill_in :name, with: params[:name]
  fill_in :username, with: params[:username]
  fill_in :email, with: params[:email]
  fill_in :password, with: params[:password]
  click_button "Sign up"
end

def create_peep(message = "My first peep")
  visit "/peeps/new"
  fill_in :message, with: message
  click_button "Share"
end

def login(params = { email: "amy@gmail.com",
                     password: "my_password"})
  visit "/peeps"
  fill_in :emailLogin, with: params[:email]
  fill_in :passwordLogin, with: params[:password]
  click_button "Login"
end

def logout
  click_link "Logout"
end
