
def add_cheep(cheep)
  fill_in 'cheep', :with => cheep
  click_button 'send cheep!'
end

def add_hello_world_cheep
  visit 'cheeps/new'
  add_cheep("Hello world!")
end

def sign_up(name, username, email, password, password2 = "")
  visit "/signup"
  fill_in 'name', :with => name
  fill_in 'username', :with => username
  fill_in 'email', :with => email
  fill_in 'password', :with => password
  click_button "join chitter!"
end

def sign_up_as_clement
  sign_up("Clement", "Attles1883", "cricket@hotmail.com", "ilovecricket")
end
