
def add_cheep(cheep)
  fill_in 'cheep', :with => cheep
  click_button 'send cheep!'
end

def add_hello_world_cheep
  visit 'cheeps/new'
  add_cheep("Hello world!")
end
