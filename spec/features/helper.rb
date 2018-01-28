
def add_cheep(cheep)
  visit 'cheeps/new'
  fill_in 'cheep', :with => cheep
  click_button 'send cheep!'
end

def add_hello_world_cheep
  add_cheep("Hello world!")
end
