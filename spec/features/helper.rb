
def add_cheep(cheep)
  fill_in 'cheep', :with => cheep
  click_button 'send cheep!'
end

def add_hello_world_cheep
  visit 'cheeps/new'
  add_cheep("Hello world!")
end

def sign_up_as_clement
  visit "/signup"
  fill_in 'name', :with => "Clement"
  fill_in 'username', :with => "Attlee83"
  fill_in 'password', :with => "ilovecricket"
  click_button "join chitter!"
end
